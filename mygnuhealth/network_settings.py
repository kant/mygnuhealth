from PySide2.QtCore import QObject, Signal, Slot, Property
from tinydb import TinyDB, Query
from mygnuhealth.myghconf import dbfile
from mygnuhealth.fedlogin import test_federation_connection as fc
import datetime
import bcrypt

class NetworkSettings(QObject):
    def __init__(self):
        QObject.__init__(self)

    db = TinyDB(dbfile)

    def update_federation_info(self, protocol, federation_server, federation_port,
                               federation_id, enable_sync):

        fedinfo = self.db.table('federation')
        #If the "Singleton" table is empty, insert, otherwise, update
        #TODO: Use upsert with doc_id == 1 as condition
        if (len(fedinfo) == 0):
            fedinfo.insert({'protocol':protocol,
                            'federation_server':federation_server,
                            'federation_port':federation_port,
                            'federation_id':federation_id,
                            'enable_sync':enable_sync})
        else:
            fedinfo.update({'protocol':protocol,
                            'federation_server':federation_server,
                            'federation_port':federation_port,
                            'federation_id':federation_id,
                            'enable_sync':enable_sync})
            

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
