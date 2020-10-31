from PySide2.QtCore import QObject, Signal, Slot, Property
from tinydb import TinyDB, Query
from mygnuhealth.myghconf import dbfile
import datetime
import bcrypt

class ProfileSettings(QObject):
    def __init__(self):
        QObject.__init__(self)

    db = TinyDB(dbfile)

    def update_masterkey(self, password):
        encrypted_key = bcrypt.hashpw(password.encode('utf-8'), \
            bcrypt.gensalt()).decode('utf-8')

        credentials = self.db.table('credentials')
        credentials.update({'master_key':encrypted_key})

        print ("Saved master key", encrypted_key)


    @Slot (str)
    def getvals(self,password):
        self.update_masterkey(password)
        self.setOK.emit()

    # Signal to emit to QML if the blood pressure values were stored correctly
    setOK = Signal()
