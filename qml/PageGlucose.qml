import QtQuick 2.7
import org.kde.kirigami 2.5 as Kirigami
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import Glucose 0.1

Kirigami.Page
{
id: glucosePage
title: qsTr("Blood Pressure Monitor")

    Glucose { // Glucose object registered at main.py
        id: blood_glucose
        onSetOK: {
            pageStack.pop() // Return to main monitor page once values are stored
        }
    }


    Kirigami.FormLayout {
        id: content
        anchors.fill: parent

        TextField {
            id: txtGlucose
            placeholderText: qsTr("Blood Glucose")
            maximumLength: 3
            font.pointSize: 50
            font.bold: true
            horizontalAlignment: TextInput.AlignHCenter
            background: Rectangle {
                implicitWidth: 40
                implicitHeight: 200
                }
            }

        Button {
            id: buttonSetGlucose
            anchors.horizontalCenter: txtGlucose.horizontalCenter
            anchors.top: txtGlucose.bottom
            text: qsTr("Done")
            flat: false
            onClicked: {
                blood_glucose.getvals(txtGlucose.text);
            }

        }
    }
}
