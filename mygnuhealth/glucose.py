import datetime
from uuid import uuid4
from PySide2.QtCore import QObject, Signal, Slot, Property
from tinydb import TinyDB, Query
from mygnuhealth.myghconf import dbfile

class Glucose(QObject):

    db = TinyDB(dbfile)

    def insert_values(self, blood_glucose):
        glucose = self.db.table('glucose')
        current_date = datetime.datetime.now().isoformat()

        if blood_glucose > 0:
            event_id = str(uuid4())
            synced = False
            glucose.insert({'timestamp': current_date,
                            'event_id': event_id,
                            'synced': synced,
                            'glucose': blood_glucose})

            print ("Saved glucose",event_id, synced,blood_glucose,
                   current_date)


    @Slot(int)
    def getvals(self, blood_glucose):
        self.insert_values(blood_glucose)
        self.setOK.emit()

    # Signal to emit to QML if the glucose values were stored correctly
    setOK = Signal()
