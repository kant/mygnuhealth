import QtQuick 2.7
import org.kde.kirigami 2.5 as Kirigami
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import Weight 0.1

Kirigami.Page
{
id: glucosePage
title: qsTr("Body Weight Monitor")

    Weight { // Weight object registered at main.py
        id: body_weight
        onSetOK: {
            pageStack.pop() // Return to main monitor page once values are stored
        }
    }

    ColumnLayout {
        id: content
        spacing: 10
        anchors.centerIn: parent
        TextField {
            id: txtWeight
            placeholderText: qsTr("Body Weight")
            maximumLength: 4
            font.pointSize: 30
            font.bold: true
            horizontalAlignment: TextInput.AlignHCenter
            background: Rectangle {
                implicitWidth: 40
                implicitHeight: 200
                }
            }

        Button {
            id: buttonSetWeight
            Layout.alignment: Qt.AlignHCenter
            text: qsTr("Done")
            flat: false
            onClicked: {
                body_weight.getvals(txtWeight.text);
            }

        }
    }
}
