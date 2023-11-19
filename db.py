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
  # flashcards = db.relationship("flashcard", cascade="delete")