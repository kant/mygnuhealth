from PySide2.QtCore import QObject, Signal, Slot, Property
from tinydb import TinyDB, Query
from mygnuhealth.myghconf import dbfile
import datetime

class Osat(QObject):
    def __init__(self):
        QObject.__init__(self)

    db = TinyDB(dbfile)

    def insert_values(self, hb_osat):
        osat = self.db.table('osat')
        current_date = datetime.datetime.now().isoformat()

        if ((hb_osat > 0)):
            osat.insert({'timestamp': current_date,
                                   'osat': hb_osat})

            print ("Saved osat",hb_osat, current_date)


    @Slot (int)
    def getvals(self,hb_osat):
        self.insert_values(hb_osat)
        self.setOK.emit()

    # Signal to emit to QML if the body pressure values were stored correctly
    setOK = Signal()
