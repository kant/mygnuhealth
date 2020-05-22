import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import org.kde.kirigami 2.5 as Kirigami
import GHBio 0.1

Kirigami.Page
{
id: biopage
title: qsTr("GNU Health - BIO")

    GHBio { // GHBio object registered at main.py
        id: ghbio
    }

    ColumnLayout {
        anchors.fill: parent
        Rectangle {
            id:bp
            width: 350
            height: 100
            color: "#cd5c5c"
            border.color: "grey"
            border.width: 5
            radius: 10
            Text {
                id: txtbpHeader
                text: "Blood Pressure"
                font.pointSize: 30
                anchors.centerIn: parent
                }
            Text {
                id: txtBp
                property var bpinfo: ghbio.bp
                text: bpinfo
                font.pointSize: 10
                anchors.horizontalCenter: txtbpHeader.horizontalCenter
                anchors.top: txtbpHeader.bottom
                }
            MouseArea {
                anchors.fill: parent
                onClicked: pageStack.push(Qt.resolvedUrl("PageBloodpressure.qml"))
            }
        }

        Rectangle {
            width: 350
            height: 100
            color: "#008b8b"
            border.color: "grey"
            border.width: 5
            radius: 10
            Text {
                text: "Glucose level"
                font.pointSize: 30
                anchors.centerIn: parent
                }
            }

        Rectangle {
            width: 350
            height: 100
            color: "#deb887"
            border.color: "grey"
            border.width: 5
            radius: 10
            Text {
                text: "Weight"
                font.pointSize: 30
                anchors.centerIn: parent
                }
            }

        Rectangle {
            width: 350
            height: 100
            color: "#ff7f50"
            border.color: "grey"
            border.width: 5
            radius: 10
            Text {
                text: "Osat"
                font.pointSize: 20
                anchors.centerIn: parent
                }
            }

    }


    actions.main: Kirigami.Action {
        text: qsTr("Logout")
        onTriggered: {
            // Clear the stack and go to the initial page
            pageStack.clear()
            pageStack.push(Qt.resolvedUrl("PageInitial.qml"))
        }
    }
}
