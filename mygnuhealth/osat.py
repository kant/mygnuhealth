import datetime
from uuid import uuid4
from PySide2.QtCore import QObject, Signal, Slot, Property
from tinydb import TinyDB, Query
from mygnuhealth.myghconf import dbfile


class Osat(QObject):

    db = TinyDB(dbfile)

    def insert_values(self, hb_osat):
        osat = self.db.table('osat')
        current_date = datetime.datetime.now().isoformat()

        if hb_osat > 0:
            event_id = str(uuid4())
            synced = False
            osat.insert({'timestamp': current_date,
                         'event_id': event_id,
                         'synced': synced,
                         'osat': hb_osat})

            print ("Saved osat",event_id, synced, hb_osat, current_date)


    @Slot (int)
    def getvals(self,hb_osat):
        self.insert_values(hb_osat)
        self.setOK.emit()

    # Signal to emit to QML if the Osat values were stored correctly
    setOK = Signal()
