import QtQuick 2.7
import org.kde.kirigami 2.5 as Kirigami
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3


Kirigami.Page
{
id: phrpage
title: qsTr("GNU Health")
    ColumnLayout {
        anchors.fill: parent
        Rectangle {
            width: 350
            height: 120
            color: "#cd5c5c"
            border.color: "grey"
            border.width: 5
            radius: 10
            Text {
                text: "BIO"
                font.pointSize: 30
                anchors.centerIn: parent
                }
            }

        Rectangle {
            width: 350
            height: 120
            color: "#008b8b"
            border.color: "grey"
            border.width: 5
            radius: 10
            Text {
                text: "PSYCHO"
                font.pointSize: 30
                anchors.centerIn: parent
                }
            }

        Rectangle {
            width: 350
            height: 120
            color: "#deb887"
            border.color: "grey"
            border.width: 5
            radius: 10
            Text {
                text: "SOCIAL"
                font.pointSize: 30
                anchors.centerIn: parent
                }
            }

        Rectangle {
            width: 350
            height: 60
            color: "#ff7f50"
            border.color: "grey"
            border.width: 5
            radius: 10
            Text {
                text: "EMERGENCY"
                font.pointSize: 20
                anchors.centerIn: parent
                }
            }

    }


    actions.main: Kirigami.Action {
        text: qsTr("Logout")
        onTriggered: pageStack.push(Qt.resolvedUrl("PageInitial.qml"))
    }
}
