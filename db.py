from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Category(db.Model):
  """
  Category Model
  """
  __tablename__ = "task"
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

  def serialize(self):
    """
    Serialize a Course Object
    """
    return {
      "id": self.id,
      "name": self.name,
      "description": self.description,
      "foler": self.folder,
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