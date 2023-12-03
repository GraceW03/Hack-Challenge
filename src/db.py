import datetime
import hashlib
import os
import bcrypt

from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


class Category(db.Model):
  """
  Category Model
  """
  __tablename__ = "category"
  id = db.Column(db.Integer, primary_key=True, autoincrement=True)
  name = db.Column(db.String, nullable=False)
  description = db.Column(db.String)
  folder = db.Column(db.String, nullable=False)

  user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
  flashcards = db.relationship("Flashcard", cascade="delete")

  def __init__(self, **kwargs):
    """
    Initialize a Category Object
    """
    self.name = kwargs.get("name")
    self.description = kwargs.get("description", "")
    self.folder = kwargs.get("folder")
    self.user_id = kwargs.get("user_id")

  def get_flashcards(self):
    """
    Returns the category's flashcards
    """
    return [f.simple_serialize() for f in self.flashcards]
  
  def update_category(self, **kwargs):
    """
    Updates a category to new name and/or description
    """
    if "name" in kwargs:
         self.name = kwargs["name"]
    if "description" in kwargs:
        self.description = kwargs["description"]

  def serialize(self):
    """
    Serialize a Course Object
    """
    return {
      "id": self.id,
      "name": self.name,
      "description": self.description,
      "folder": self.folder,
      "flashcards": [f.simple_serialize() for f in self.flashcards]
    }

  def simple_serialize(self):
    """
    Serialize a Category Object with only name and description
    """
    return {
      "id": self.id,
      "name": self.name,
      "description": self.description,
    }

class Flashcard(db.Model):
  """
  Flashcard Model
  """
  __tablename__ = "flashcard"

  id = db.Column(db.Integer, primary_key=True, autoincrement=True)
  content = db.Column(db.String, nullable=False)
  answer = db.Column(db.String, nullable=False)
  category_id = db.Column(db.Integer, db.ForeignKey("category.id"), nullable=False)


  def __init__(self, **kwargs):
        """
        Initializes a Flashcard Object
        """
        self.content = kwargs.get("content")
        self.answer = kwargs.get("answer")
        self.category_id = kwargs.get("category_id")

  def update_flashcard(self, **kwargs):
    """
    Updates a flashcard to new content and/or answer
    """
    if "content" in kwargs:
         self.content = kwargs["content"]
    if "answer" in kwargs:
        self.answer = kwargs["answer"]

  def serialize(self):
        """
        Serialize a Flashcard object
        """
        return {
            "id": self.id,
            "content": self.content,
            "answer": self.answer,
            "category": (Category.query.get(self.category_id)).simple_serialize()
        }
  
  def simple_serialize(self):
        """
        Serialize a Flashcard object
        """
        return {
            "id": self.id,
            "content": self.content,
            "answer": self.answer
        }


# class Folder(db.Model):
#    """
#    Folder Model
#    """
#    __tablename__ = "folder"


class User(db.Model):
  """
  User Model
  """
  __tablename__ = "user"

  id = db.Column(db.Integer, primary_key=True, autoincrement=True)
  username = db.Column(db.String, nullable=False, unique=True)
  password_digest = db.Column(db.String, nullable=False, unique=False)
  
  session_token = db.Column(db.String, nullable=False, unique=False)
  session_expiration = db.Column(db.DateTime, nullable=False, unique=False)
  refresh_token = db.Column(db.String, nullable=False, unique=False)

  folders = db.Column(db.String, nullable=False, unique=False)
  categories = db.relationship('Category', backref='user')

  def __init__(self, **kwargs):
    """
    Initializes a User Object
    """
    self.username = kwargs.get("username")
    self.password_digest = bcrypt.hashpw(kwargs.get("password").encode("utf8"), bcrypt.gensalt(rounds=13))
    self.folders = ""
    self.renew_session()

  def add_folder(self, name):
     if self.folders != "":
        self.folders += ","
     self.folders = self.folders + name


  def _urlsafe_base_64(self):
    """
    Used to randomly generate/refresh tokens
    """
    return hashlib.sha1(os.urandom(64)).hexdigest()

  def renew_session(self):
    """
    Generates new tokens and resets expiration time
    """
    self.session_token = self._urlsafe_base_64()
    self.refresh_token = self._urlsafe_base_64()
    self.session_expiration = datetime.datetime.now() + datetime.timedelta(days=1)

  def verify_password(self, password):
    """
    Verifies password
    """
    return bcrypt.checkpw(password.encode("utf8"), self.password_digest)
  
  def verify_session_token(self, session_token):
    """
    Verifies session token
    """
    return session_token == self.session_token and datetime.datetime.now() < self.session_expiration

  def verify_refresh_token(self, refresh_token):
    """
    Verifies refresh token
    """
    return refresh_token == self.refresh_token