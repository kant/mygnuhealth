from PySide2.QtCore import QObject, Signal, Slot, Property
import bcrypt
from tinydb import TinyDB, Query
from mygnuhealth.myghconf import dbfile
from mygnuhealth.core import get_personal_key

class GHLogin(QObject):

    db = TinyDB(dbfile)

    @Slot(str)
    def getKey(self, key):

        key = key.encode()

        personal_key = get_personal_key(self.db)

        if bcrypt.checkpw(key, personal_key):
            print("Login correct - Move to main PHR page")
            self.loginOK.emit()
        else:
            self.errorOccurred.emit()


    # Signal to emit to QML if the provided credentials are correct
    loginOK = Signal()
    errorOccurred = Signal()
