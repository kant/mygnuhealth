from PySide2.QtCore import QObject, Signal, Slot, Property
from tinydb import TinyDB, Query
from myghconf import dbfile
import datetime
import matplotlib.pyplot as plt
import io
import base64

class GHBio(QObject):
    def __init__(self):
        QObject.__init__(self)

        self.current_bp = ""

    db = TinyDB(dbfile)

    def read_bp(self):
        #Retrieve all the BP / HR history
        blood_pressure = self.db.table('bloodpressure')
        hr = self.db.table('heart_rate')
        bphist = blood_pressure.all()
        hrhist = hr.all()
        return (bphist,hrhist)

    def getBP(self):
        # Extracts the latest readings from BP / HR
        bphist,hrhist = self.read_bp()
        bp = bphist[-1]  # Get the latest (newest) record
        hr = hrhist[-1]

        dateobj =  datetime.datetime.fromisoformat(bp['timestamp'])
        date_repr = dateobj.strftime("%a, %b %d '%y - %H:%M")

        bpobj = [str(date_repr), str(bp['systolic']), str(bp['diastolic']),
                                     str(hr['heart_rate'])]
        return bpobj

    def getBPHist(self):
        # Retrieves all the history and packages into an array.
        bphist,hrhist = self.read_bp()
        bphrhist = []

        """TODO:
            The best would be to be able to pass the JSON dictionary
            instead of an array of arrays to QVariantList.

        """

        bpsys = []
        bpdia = []
        hr = []
        for element in bphist:
            bpsys.append(element['systolic'])
            bpdia.append(element['diastolic'])
        bphrhist.append(bpsys)
        bphrhist.append(bpdia)

        for element in hrhist:
            hr.append(element['heart_rate'])
        bphrhist.append(hr)

        return bphrhist


    def getBPplot(self):
        # Retrieves all the history and packages into an array.
        bphist,hrhist = self.read_bp()
        bphrhist = []

        """TODO:
            The best would be to be able to pass the JSON dictionary
            instead of an array of arrays to QVariantList.

        """

        bpsys = []
        bpdia = []
        hr = []
        for element in bphist:
            bpsys.append(element['systolic'])
            bpdia.append(element['diastolic'])
        bphrhist.append(bpsys)
        bphrhist.append(bpdia)

        for element in hrhist:
            hr.append(element['heart_rate'])
        bphrhist.append(hr)


        fig, axs = plt.subplots(3)
        axs[0].plot(bpsys)
        axs[1].plot(bpdia, color='teal')
        # bp.plot(bpdia)
        # fig.show()
        # fig.autofmt_xdate()
        axs[2].plot(hr, color="orange")
        holder = io.BytesIO()
        fig.savefig(holder, format="svg")
        image = "data:image/svg+xml;base64," + \
            base64.b64encode(holder.getvalue()).decode()

        holder.close()
        return (image)

    def setBP(self, bp):
        self.current_bp = bp
        # Call the notifying signal
        self.bpChanged.emit()

    # Notifying signal - to be used in qml as "onBPChanged"
    bpChanged = Signal()

    # BP property to be accessed to and from QML and Python.
    # It is used in the context of showing the BP last results
    # in the main bio screen.
    bp = Property("QVariantList", getBP, setBP, notify=bpChanged)

    # BP property to be accessed to and from QML and Python.
    bpplot = Property(str, getBPplot, setBP, notify=bpChanged)
