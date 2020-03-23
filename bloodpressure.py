from PySide2.QtCore import QObject, Signal, Slot, Property
from tinydb import TinyDB, Query
from myghconf import dbfile

class BloodPressure(QObject):
    def __init__(self):
        QObject.__init__(self)

    db = TinyDB(dbfile)

    @Slot (int, int)
    def getvals(self,systolic, diastolic):
        print (systolic, diastolic)
        self.setOK.emit()

    # Signal to emit to QML if the blood pressure values were stored correctly
    setOK = Signal()
