from PySide2.QtCore import QObject, Signal, Slot, Property
from tinydb import TinyDB, Query
from myghconf import dbfile
import datetime

class GHBio(QObject):
    def __init__(self):
        QObject.__init__(self)

        self.current_bp = ""

    db = TinyDB(dbfile)

    def read_bp(self):
        blood_pressure = self.db.table('bloodpressure')
        hr = self.db.table('heart_rate')
        latestbp = blood_pressure.all()[-1]  # Get the latest (newest) record
        latesthr = hr.all()[-1]
        return (latestbp,latesthr)

    def getBP(self):
        bp,hr = self.read_bp()
        dateobj =  datetime.datetime.fromisoformat(bp['timestamp'])
        date_repr = dateobj.strftime("%a, %b %d '%y - %H:%M")

        bpobj = [str(date_repr), str(bp['systolic']), str(bp['diastolic']),
                                     str(hr['heart_rate'])]
        return bpobj

    def setBP(self, bp):
        self.current_bp = bp
        # Call the notifying signal
        self.bpChanged.emit()

    # Notifying signal - to be used in qml as "onBPChanged"
    bpChanged = Signal()

    # BP property to be accessed to and from QML and Python.
    bp = Property("QVariantList", getBP, setBP, notify=bpChanged)
