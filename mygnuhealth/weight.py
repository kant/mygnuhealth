import datetime
from uuid import uuid4
from PySide2.QtCore import QObject, Signal, Slot, Property
from tinydb import TinyDB, Query
from mygnuhealth.myghconf import dbfile


class Weight(QObject):

    db = TinyDB(dbfile)

    def insert_values(self, body_weight):
        weight = self.db.table('weight')
        current_date = datetime.datetime.now().isoformat()

        if body_weight > 0:
            event_id = str(uuid4())
            synced = False
            weight.insert({'timestamp': current_date,
                           'event_id': event_id,
                           'synced': synced,
                           'weight': body_weight})

            print("Saved weight", event_id, synced, body_weight, current_date)


    @Slot(float)
    def getvals(self, body_weight):
        self.insert_values(body_weight)
        self.setOK.emit()

    # Signal to emit to QML if the body weight values were stored correctly
    setOK = Signal()
