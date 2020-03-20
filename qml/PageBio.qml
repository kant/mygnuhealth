import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import org.kde.kirigami 2.5 as Kirigami


Kirigami.Page
{
id: biopage
title: qsTr("GNU Health - BIO")
    ColumnLayout {
        anchors.fill: parent
        Rectangle {
            width: 350
            height: 100
            color: "#cd5c5c"
            border.color: "grey"
            border.width: 5
            radius: 10
            Text {
                text: "Blood Pressure"
                font.pointSize: 30
                anchors.centerIn: parent
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
