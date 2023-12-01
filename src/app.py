import json
import random

from db import db
from flask import Flask
from flask import request
import os
from db import Category
from db import Flashcard

# define db filename
db_filename = "quizrizz.db"
app = Flask(__name__)

# setup config
app.config["SQLALCHEMY_DATABASE_URI"] = f"sqlite:///{db_filename}"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_ECHO"] = True

# initialize app
db.init_app(app)
with app.app_context():
    db.create_all()

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
    body = json.loads(request.data)
    name = body.get("name")
    description = body.get("description", "")
    folder = body.get("folder")
    if (name is None or folder is None):
        return failure_response("Must contain a name and folder", 400)
    new_category = Category(name=name, description=description, folder=folder)
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

    print("The id is", category_id)
    
    new_flashcard = Flashcard(content=content, answer=answer, 
                              category_id=category_id)
    
    db.session.add(new_flashcard)
    db.session.commit()
    return success_response(new_flashcard.serialize(), 201)


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
    return success_response(flashcard.serialize())

@app.route("/api/flashcards-update/<int:id>/", methods=["POST"])
def update_flashcard(flashcard_id):
    """
    Endpoint for updating the flashcard with id flashcard_id
    """
    flashcard = Flashcard.query.filter_by(flashcard_id=flashcard_id).first()
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


if __name__ == "__main__":
    port = int(os.environ.get("PORT", 8000))
    app.run(host="0.0.0.0", port=port)
