import json

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



app.route("/api/flashcards/", methods=["GET"])
def get_all_flashcards:
    """
    Endpoint for getting all courses
    """

    courses = [course.simple_serialize() for course in Course.query.all()]
    return success_response({"courses": courses})