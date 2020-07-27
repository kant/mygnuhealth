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
        #Retrieve the BP history
        blood_pressure = self.db.table('bloodpressure')
        bphist = blood_pressure.all()
        return (bphist)

    def read_hr(self):
        #Retrieve the HR history
        hr = self.db.table('heart_rate')
        hrhist = hr.all()
        return (hrhist)

    def getBP(self):
        # Extracts the latest readings from BP
        bphist = self.read_bp()
        hrhist = self.read_hr()
        bp = bphist[-1]  # Get the latest (newest) record
        hr = hrhist[-1]

        dateobj =  datetime.datetime.fromisoformat(bp['timestamp'])
        date_repr = dateobj.strftime("%a, %b %d '%y - %H:%M")

        bpobj = [str(date_repr), str(bp['systolic']), str(bp['diastolic']),
                                     str(hr['heart_rate'])]
        return bpobj

    def getBPHist(self):
        # Retrieves all the history and packages into an array.
        bphist = self.read_bp()
        hrhist = self.read_hr()
        bphrhist = []

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


    def BPplot(self):
        # Retrieves all the history and packages into an array.
        bphist = self.read_bp()
        bpsys = []
        bpdia = []
        bp_date = []
        lastreading=''
        for element in bphist:
            dateobj =  datetime.datetime.fromisoformat(element['timestamp'])
            date_repr = dateobj.strftime("%a, %b %d '%y")

            # Only print one value per day to avoid artifacts in plotting.
            if (lastreading != date_repr):
                bp_date.append(dateobj)
                bpsys.append(element['systolic'])
                bpdia.append(element['diastolic'])

            lastreading = date_repr

        fig, axs = plt.subplots(2)

        #Plot both systolic and diastolic history
        axs[0].plot(bp_date, bpsys)
        axs[1].plot(bp_date, bpdia, color='teal')

        axs[0].set_ylabel('Systolic', size=13)
        axs[1].set_ylabel('Diastolic', size=13)

        fig.autofmt_xdate()
        fig.suptitle("Blood Pressure (mm Hg)",size=20)
        holder = io.BytesIO()
        fig.savefig(holder, format="svg")
        image = "data:image/svg+xml;base64," + \
            base64.b64encode(holder.getvalue()).decode()

        holder.close()
        return (image)


    def HRplot(self):
        # Retrieves all the history and packages into an array.
        hrhist = self.read_hr()
        hr = []
        hr_date= []
        lastreading=''
        for element in hrhist:
            dateobj =  datetime.datetime.fromisoformat(element['timestamp'])
            date_repr = dateobj.strftime("%a, %b %d '%y")
            # Only print one value per day to avoid artifacts in plotting.
            if (lastreading != date_repr):
                hr_date.append(dateobj)
                hr.append(element['heart_rate'])

            lastreading = date_repr

        fig = plt.figure()
        ax = fig.add_subplot(1, 1, 1)

        ax.plot(hr_date, hr, color="orange")

        ax.set_ylabel('Frequency',size=13)
        fig.autofmt_xdate()
        fig.suptitle("Heart Rate (bpm)",size=20)

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

    # Property to retrieve the plot of the Blood pressure.
    bpplot = Property(str, BPplot, setBP, notify=bpChanged)

    # Retrieve the heart rate history.
    # I made a different plot because the dates can differ from those of the 
    # Blood pressure monitor readings.
    hrplot = Property(str, HRplot, setBP, notify=bpChanged)
