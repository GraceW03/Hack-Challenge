import json
import random

from db import db
from flask import Flask
from flask import request
import os
from db import Category
from db import Flashcard

import users_dao
import datetime

# define db filename
db_filename = "quizrizz.db"
app = Flask(__name__)
curr_user = None

# setup config
app.config["SQLALCHEMY_DATABASE_URI"] = f"sqlite:///{db_filename}"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_ECHO"] = True

# initialize app
db.init_app(app)
with app.app_context():
    db.create_all()

def extract_token(request):
    auth_header = request.headers.get("Authorization")
    if auth_header is None:
        return False, json.dumps({"error": "Missing Authorization header"})
    
    bearer_token = auth_header.replace("Bearer", "").strip()
    if not bearer_token:
        return False, json.dumps({"error": "Invalid Authorization header"})
    return True, bearer_token

# generalized response formats
def success_response(data, code=200):
    """
    Generalized success response function
    """
    return json.dumps(data), code

def failure_response(message, code=404):
    """
    Generalized failure response function
    """
    return json.dumps({"error": message}), code

@app.route("/")
def base():
    return "Welcome to QuizRizz"

# -- CATEGORY ROUTES ------------------------------------------------------

@app.route("/api/categories/")
def get_all_categories():
    """
    Endpoint for getting all categories
    """
    categories = [category.simple_serialize() for category in Category.query.all()]
    return success_response({"categories": categories})

@app.route("/api/categories/", methods=["POST"])
def create_category():
    """
    Endpoint for creating a new category
    """
    if (curr_user is None):
        return failure_response("login")
    body = json.loads(request.data)
    name = body.get("name")
    description = body.get("description", "")
    folder = body.get("folder")
    if (name is None or folder is None):
        return failure_response("Must contain a name and folder", 400)
    new_category = Category(name=name, description=description, folder=folder,
                            user_id=curr_user.id)
    db.session.add(new_category)
    db.session.commit()
    return success_response(new_category.serialize(), 201)

@app.route("/api/categories/<int:id>/")
def get_category_by_id(id):
    """
    Endpoint for getting a category by id
    """
    category = Category.query.filter_by(id=id).first()
    if category is None:
        return failure_response("Category not found")
    return success_response(category.serialize())

@app.route("/api/categories/<int:id>/", methods=["DELETE"])
def delete_category(id):
    """
    Endpoint for deleting a category by id
    """
    category = Category.query.filter_by(id=id).first()
    if category is None:
        return failure_response("Category not found")
    db.session.delete(category)
    db.session.commit()
    return success_response(category.serialize())

@app.route("/api/categories/<int:id>/", methods=["POST"])
def update_category(id):
    """
    Endpoint for updating a category by id
    """
    category = Category.query.filter_by(id=id).first()
    if category is None:
        return failure_response("Category not found")
    
    body = json.loads(request.data)
    name = body.get("name")
    description = body.get("description")

    if name is not None:
      category.update_category(name=name)
    if description is not None:
      category.update_category(description=description)
    db.session.commit()
    return success_response(category.serialize())

# -- FLASHCARD ROUTES ------------------------------------------------------

@app.route("/api/flashcards/<int:category_id>/", methods=["GET"])
def get_all_flashcards_in_category(category_id):
    """
    Endpoint for getting all flashcards in a category with category_id
    """
    category = Category.query.filter_by(id=category_id).first()
    if not isinstance(category, Category):
        return category

    return success_response({"flashcards": category.get_flashcards()})


@app.route("/api/flashcards-random/<int:category_id>/", methods=["GET"])
def get_random_flashcard_in_category(category_id):
    """
    Endpoint for a random flashcard in a category with category_id
    """
    
    category = Category.query.filter_by(id=category_id).first()
    flashcards = category.get_flashcards()

    if len(flashcards) == 0:
        return failure_response("No flashcards in this category")
    
    return success_response(random.choice(flashcards))


@app.route("/api/flashcards/<int:category_id>/", methods=["POST"])
def create_flashcard(category_id):
    """
    Endpoint for creating a new flashcard in the category category_id
    """

    try:
        body = json.loads(request.data)
        content = body.get("content")
        answer = body.get("answer")
        if content == None or answer == None:
            return failure_response("Wrong info provided", 400)
    except:
        return failure_response("json fail", 400)
    
    new_flashcard = Flashcard(content=content, answer=answer, 
                              category_id=category_id)
    
    db.session.add(new_flashcard)
    db.session.commit()
    return success_response(new_flashcard.simple_serialize(), 201)


@app.route("/api/flashcards/<int:flashcard_id>/", methods=["DELETE"])
def delete_flashcard(flashcard_id):
    """
    Endpoint for deleting the flashcard with id flashcard_id
    """
    flashcard = Flashcard.query.filter_by(id=flashcard_id).first()
    if flashcard is None:
        return failure_response("Flashcard not found")

    db.session.delete(flashcard)
    db.session.commit()
    return success_response(flashcard.simple_serialize())

@app.route("/api/flashcards-update/<int:flashcard_id>/", methods=["POST"])
def update_flashcard(flashcard_id):
    """
    Endpoint for updating the flashcard with id flashcard_id
    """
    flashcard = Flashcard.query.filter_by(id=flashcard_id).first()
    if flashcard is None:
        return failure_response("Flashcard not found")
    body = json.loads(request.data)
    content = body.get("content")
    answer = body.get("answer")

    if content is None and answer is None:
        return failure_response("Wrong info provided", 400)
        
    if content is not None:
        flashcard.update_flashcard(content=content)
    if answer is not None:
        flashcard.update_flashcard(answer=answer)

    db.session.commit()
    return success_response(flashcard.simple_serialize())


# -- FOLDER ROUTES ---------------------------------------------

@app.route("/api/folders/")
def get_folders():
    """
    Endpoint for getting folders 
    """
    return success_response({"folders": curr_user.folders.split(',')})
    
@app.route("/api/folders/", methods=["POST"])
def make_folder():
    """
    Endpoint for creating a new folder
    """
    body = json.loads(request.data)
    name = body.get("name")
    if name is None:
        return failure_response("folder needs a name")
    curr_user.add_folder(name)
    db.session.commit()
    return success_response({"name": name})
    
@app.route("/api/folders/<name>/")
def get_decks_by_folder(name):
    """
    Endpoint for getting folders 
    """
    decks = Category.query.filter_by(user_id=curr_user.id, folder=name)
    return success_response({f"{name}_decks": [deck.simple_serialize() for deck in decks]})

# -- AUTHENTIFICATION ROUTES ---------------------------------------------

@app.route("/register/", methods=["POST"])
def register_account():
    body = json.loads(request.data)
    username = body.get("username")
    password = body.get("password")

    if username is None or password is None:
        return json.dumps({"error": "Invalid body"})

    created, user = users_dao.create_user(username, password)
    if not created:
        return json.dumps({"error": "User already exists"})

    return json.dumps({
        "session_token": user.session_token,
        "session_expiration": str(user.session_expiration),
        "refresh_token": user.refresh_token
    })

@app.route("/login/", methods=["POST"])
def login():
    body = json.loads(request.data)
    username = body.get("username")
    password = body.get("password")

    if username is None or password is None:
        return json.dumps({"error": "Invalid body"})
    
    success, user = users_dao.verify_credentials(username, password)

    if not success:
        return json.dumps({"error": "Invalid credentials"})
    
    global curr_user 
    curr_user = user

    user.renew_session()
    db.session.commit()
    return json.dumps({
        "session_token": user.session_token,
        "session_expiration": str(user.session_expiration),
        "refresh_token": user.refresh_token
    })

@app.route("/logout/", methods=["POST"])
def logout():
    """
    Endpoint for logging out a user
    """
    success, response = extract_token(request)
    if not success:
        return response
    session_token = response

    user = users_dao.get_user_by_session_token(session_token)
    if not user or not user.verify_session_token(session_token):
        return json.dumps({"error": "invalid session token"})
    user.session_expiration = datetime.datetime.now()

    global curr_user 
    curr_user = None

    db.session.commit()
    return json.dumps({"message": "you have been logged out"})

@app.route("/session/", methods=["POST"])
def refresh_session():
    """
    Endpoint for refreshing session
    """
    success, response = extract_token(request)
    if not success:
        return response
    refresh_token = response

    try:
        user = users_dao.renew_session(refresh_token)
        global curr_user 
        curr_user = user
    except:
        return json.dumps({"error": "Invalid refresh token"})
    
    return json.dumps({
        "session_token": user.session_token,
        "session_expiration": str(user.session_expiration),
        "refresh_token": user.refresh_token
    })

@app.route("/secret/", methods=["GET"])
def secret_message():
    """
    Endpoint for getting response
    """
    success, response = extract_token(request)
    if not success:
        return response
    session_token = response
    user = users_dao.get_user_by_session_token(session_token)
    if not user or not user.verify_session_token(session_token):
        return json.dumps({"error": "invalid session token"})
    
    return json.dumps({"message": "hello " + user.username})

# -- MAIN ----------------------------------------------------------

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 8000))
    app.run(host="0.0.0.0", port=port)
