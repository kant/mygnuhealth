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
                               federation_id, enable_sync):

        fedinfo = self.db.table('federation')
        print ("Counting...", len(fedinfo))
        fedinfo.update({'federation_server':federation_server},
                       {'federation_port':federation_port},
                       {'federation_id':federation_id},
                       {'enable_sync':enable_sync}, doc_id==1)



    @Slot (str,str,str,str,str)
    def test_connection(self,protocol, federation_server, federation_port,
                        federation_id, password):
        conn_res = fc(protocol, federation_server, federation_port, federation_id,
                      password)

        print (conn_res)


    @Slot (str,str,str, str,bool)
    def getvals(self,protocol, federation_server, federation_port, federation_id,
                enable_sync):
        self.update_federation_info(protocol, federation_server, federation_port,
                               federation_id, enable_sync)
        #self.setOK.emit()


    # Signal to emit to QML if the values were stored correctly
    setOK = Signal()
