from PySide2.QtCore import QObject, Signal, Slot, Property
import bcrypt
from tinydb import TinyDB, Query
from mygnuhealth.myghconf import dbfile
from mygnuhealth.core import get_master_key

class GHLogin(QObject):
    def __init__(self):
        QObject.__init__(self)

    db = TinyDB(dbfile)

    '''
    def get_master_key(self, db):
        credentials = db.table('credentials')
        # Credentials table holds a singleton, so only one record
        master_key = credentials.all()[0]['master_key']
        return master_key.encode()
    '''

    @Slot (str)
    def getKey(self,key):

        key = key.encode()

        # master_key = self.get_master_key(self.db)
        master_key = get_master_key(self.db)

        if (bcrypt.checkpw(key, master_key)):
            print ("Login correct - Move to main PHR page")
            self.loginOK.emit()

    # Signal to emit to QML if the provided credentials are correct
    loginOK = Signal()
