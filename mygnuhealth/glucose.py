from PySide2.QtCore import QObject, Signal, Slot, Property
from tinydb import TinyDB, Query
from myghconf import dbfile
import datetime

class Glucose(QObject):
    def __init__(self):
        QObject.__init__(self)

    db = TinyDB(dbfile)

    def insert_values(self, blood_glucose):
        glucose = self.db.table('glucose')
        current_date = datetime.datetime.now().isoformat()

        if ((blood_glucose > 0)):
            glucose.insert({'timestamp': current_date,
                                   'glucose': blood_glucose})

            print ("Saved glucose",blood_glucose, current_date)


    @Slot (int)
    def getvals(self,blood_glucose):
        self.insert_values(blood_glucose)
        self.setOK.emit()

    # Signal to emit to QML if the glucose values were stored correctly
    setOK = Signal()
