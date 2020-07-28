from PySide2.QtCore import QObject, Signal, Slot, Property
from tinydb import TinyDB, Query
from myghconf import dbfile
import datetime

class Weight(QObject):
    def __init__(self):
        QObject.__init__(self)

    db = TinyDB(dbfile)

    def insert_values(self, body_weight):
        weight = self.db.table('weight')
        current_date = datetime.datetime.now().isoformat()

        if ((body_weight > 0)):
            weight.insert({'timestamp': current_date,
                                   'weight': body_weight})

            print ("Saved weight",body_weight, current_date)


    @Slot (float)
    def getvals(self,body_weight):
        self.insert_values(body_weight)
        self.setOK.emit()

    # Signal to emit to QML if the body pressure values were stored correctly
    setOK = Signal()
