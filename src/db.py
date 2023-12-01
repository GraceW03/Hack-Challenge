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
  flashcards = db.relationship("flashcard", cascade="delete")

  def __init__(self, **kwargs):
    """
    Initialize a Category Object
    """
    self.name = kwargs.get("name")
    self.description = kwargs.get("description", "")
    self.folder = kwargs.get("folder")

  def get_flashcards(self):
      return [f.simple_serialize() for f in self.flashcards]
  
  def update_category(self, **kwargs):
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
  category_id = db.Column(db.Integer, db.ForeignKey("category_id"), nullable=False)


  def __init__(self, **kwargs):
        """
        Initializes a Flashcard Object
        """
        self.content = kwargs.get("content")
        self.answer = kwargs.get("answer")
        self.category_id = kwargs.get("category_id")

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