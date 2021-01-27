import datetime
from sqlalchemy import Column, Float, ForeignKey, Integer, String, DateTime
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()


class Unit(Base):
    __tablename__ = 'unit'
    unit_id = Column(Integer, primary_key=True)
    name = Column(String(3), nullable=False, unique=True)
    created = Column(DateTime)

    def __init__(self, name, created):
        self.name = name
        if created is None:
            self.created = datetime.datetime.now()
        else:
            self.created = created


class Reading(Base):
    __tablename__ = 'reading'
    reading_id = Column(Integer, primary_key=True)
    value = Column(Float)
    unit_id = Column(Integer)
    unit = ForeignKey(unit_id, Unit.unit_id)
    created = Column(DateTime)

    def __init__(self, value, unit, created):
        self.value = value
        self.unit = unit
        if created is None:
            self.created = datetime.datetime.now()
        else:
            self.created = created
