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

# -- CATEGORY ROUTES ------------------------------------------------------
@app.route("/api/categories/")
def get_all_categories():
    """
    Endpoint for getting all categories
    """
    categories = [category.serialize() for category in Category.query.all()]
    return success_response({"categories": categories})

@app.route("/api/categories/", methods=["POST"])
def create_category():
    """
    Endpoint for creating a new course
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

@app.route("/api/categories/<int:id>")
def get_category_by_id(id):
    """
    Endpoint for getting a category by id
    """
    category = Category.query.filter_by(id=id).first()
    if category is None:
        return failure_response("Category not found")
    return success_response(category.simple_serialize())

@app.route("/api/categories/<int:id>/", methods=["DELETE"])
def delete_course(id):
    """
    Endpoint for deleting a course by id
    """
    category = Category.query.filter_by(id=id).first()
    if category is None:
        return failure_response("Category not found")
    db.session.delete(category)
    db.session.commit()
    return success_response(category.serialize())




app.route("/api/flashcards/", methods=["GET"])
def get_all_flashcards():
    """
    Endpoint for getting all courses
    """

    courses = [course.simple_serialize() for course in Course.query.all()]
    return success_response({"courses": courses})