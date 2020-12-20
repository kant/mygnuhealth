import datetime
from uuid import uuid4
from PySide2.QtCore import QObject, Signal, Slot, Property
from tinydb import TinyDB, Query
from mygnuhealth.myghconf import dbfile


class BloodPressure(QObject):

    db = TinyDB(dbfile)

    def insert_values(self, systolic, diastolic, heart_rate):
        blood_pressure = self.db.table('bloodpressure')
        hr = self.db.table('heart_rate')
        current_date = datetime.datetime.now().isoformat()

        if (systolic > 0) and (diastolic > 0):
            event_id = str(uuid4())
            synced = False
            blood_pressure.insert({'timestamp': current_date,
                                   'event_id': event_id,
                                   'synced': synced,
                                   'systolic': systolic,
                                   'diastolic': diastolic})

            print("Saved blood pressure", event_id, synced, systolic,
                  diastolic, current_date)

        if heart_rate > 0:
            event_id = str(uuid4())
            synced = False
            hr.insert({'timestamp': current_date,
                       'event_id': event_id,
                       'synced': synced,
                       'heart_rate': heart_rate})

            print("Saved Heart rate", event_id, synced,
                  heart_rate, current_date)

    @Slot(int, int, int)
    def getvals(self, *args):
        self.insert_values(*args)
        self.setOK.emit()

    # Signal to emit to QML if the blood pressure values were stored correctly
    setOK = Signal()
