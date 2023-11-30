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



app.route("/api/flashcards/<int:category_id>", methods=["GET"])
def get_all_flashcards_in_category(category_id):
    """
    Endpoint for getting all flashcards in a category with category_id
    """


app.route("/api/flashcards-random/", methods=["GET"])
def get_random_flashcard_in_category(category_id):
    """
    Endpoint for a random flashcard in a category with category_id
    """
    
    flashcards = category["flashcards"]

    if len(flashcards) == 0:
        return failure_response("No flashcards in this category")
    
    return success_response((random.choice(flashcards)).serialize())


app.route("/api/flashcards/<int:category_id>", methods=["POST"])
def create_flashcard(category_id):
    """
    Endpoint for creating a new flashcard in the category category_id
    """

    try:
        body = json.loads(request.data)
        content = body.get("content")
        answer = body.get("answer")
        if code == None or body == None:
            return failure_response("Wrong info provided", 400)
    except:
        return failure_response("json fail", 400)

    
    new_flashcard = Course(content=content, answer=answer)
    
    db.session.add(new_flashcard)
    db.session.commit()
    return success_response(new_flashcard.serialize(), 201)


@app.route("/api/courses/<int:flashcard_id>/", methods=["DELETE"])
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


