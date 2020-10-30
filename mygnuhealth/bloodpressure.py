from PySide2.QtCore import QObject, Signal, Slot, Property
from tinydb import TinyDB, Query
from myghconf import dbfile
import datetime

class BloodPressure(QObject):
    def __init__(self):
        QObject.__init__(self)

    db = TinyDB(dbfile)

    def insert_values(self, systolic, diastolic, heart_rate):
        blood_pressure = self.db.table('bloodpressure')
        hr = self.db.table('heart_rate')
        current_date = datetime.datetime.now().isoformat()

        if ((systolic > 0) and (diastolic > 0)):
            blood_pressure.insert({'timestamp': current_date,
                                   'systolic': systolic,
                                   'diastolic': diastolic})
            print ("Saved blood pressure",systolic, diastolic, current_date)

        if (heart_rate > 0):
            hr.insert ({'timestamp':current_date, 'heart_rate':heart_rate})
            print ("Saved Heart rate", heart_rate, current_date)


    @Slot (int, int, int)
    def getvals(self,systolic, diastolic, heart_rate):
        self.insert_values(systolic, diastolic, heart_rate)
        self.setOK.emit()

    # Signal to emit to QML if the blood pressure values were stored correctly
    setOK = Signal()
