from PySide2.QtCore import QObject, Signal, Slot, Property
from tinydb import TinyDB, Query
from myghconf import dbfile
from fedlogin import test_federation_connection as fc
import datetime
import bcrypt

class NetworkSettings(QObject):
    def __init__(self):
        QObject.__init__(self)

    db = TinyDB(dbfile)

    def update_federation_info(self, protocol, federation_server, federation_port,
                               federation_id, password, enable_sync):

        encrypted_key = bcrypt.hashpw(password.encode('utf-8'), \
            bcrypt.gensalt()).decode('utf-8')

        fedinfo = self.db.table('federation')
        fedinfo.update({'federation_server':federation_server})
        fedinfo.update({'federation_port':federation_port})
        fedinfo.update({'federation_id':federation_id})
        fedinfo.update({'password':encrypted_key})

    @Slot (str,str,str,str,str)
    def test_connection(self,protocol, federation_server, federation_port,
                        federation_id, password):
        conn_res = fc(protocol, federation_server, federation_port, federation_id,
                      password)

        print (conn_res)


    @Slot (str,str,str, str,str,bool)
    def getvals(self,protocol, federation_server, federation_port, federation_id,
                password, enable_sync):
        self.update_federation_info(federation_server, federation_id, password)
        self.setOK.emit()


    # Signal to emit to QML if the values were stored correctly
    setOK = Signal()
