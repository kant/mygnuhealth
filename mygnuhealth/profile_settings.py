from PySide2.QtCore import QObject, Signal, Slot, Property
from tinydb import TinyDB, Query
from mygnuhealth.myghconf import dbfile
from mygnuhealth.core import get_personal_key
import datetime
import bcrypt

class ProfileSettings(QObject):
    def __init__(self):
        QObject.__init__(self)

    db = TinyDB(dbfile)

    def check_current_password(self, current_password):
        personal_key = get_personal_key(self.db)
        cpw = current_password.encode()
        if (bcrypt.checkpw(cpw, personal_key)):
            rc = True
        else:
            print("Wrong current password")
            rc = False
        return rc

    def check_new_password(self, password, password_repeat):
        if (password == password_repeat):
            rc = True
        else:
            print("new passwords do not match")
            rc = False
        return rc

    def update_personalkey(self, password):
        encrypted_key = bcrypt.hashpw(password.encode('utf-8'), \
            bcrypt.gensalt()).decode('utf-8')

        credentials = self.db.table('credentials')
        credentials.update({'personal_key':encrypted_key})

        print ("Saved personal key", encrypted_key)


    @Slot (str, str, str)
    def getvals(self,current_password, password, password_repeat):
        if (self.check_current_password(current_password) and
            self.check_new_password(password, password_repeat)):
            self.update_personalkey(password)
            self.setOK.emit()

    # Signal to emit to QML if the password was stored correctly
    setOK = Signal()
