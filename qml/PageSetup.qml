import QtQuick 2.7
import org.kde.kirigami 2.5 as Kirigami
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3


Kirigami.Page
{
id: phrpage
title: qsTr("MyGNUHealth Settings")

    ColumnLayout {
        spacing: 10
        Rectangle {
            id:profilerectangle
            color: "#108498"
            Layout.alignment: Qt.AlignCenter

            Layout.preferredWidth: 350
            Layout.preferredHeight: 100
            radius: 10

            Image {
                id: profileIcon
                anchors.fill: parent
                source: "../images/profile-icon.svg"
                fillMode:Image.PreserveAspectFit
            }
            MouseArea {
            anchors.fill: parent
            onClicked: pageStack.push(Qt.resolvedUrl("PageProfileSettings.qml"))
            }
        }
        Rectangle {
            id:networkrectangle
            color: "#108498"
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 350
            Layout.preferredHeight: 100

            radius: 10

            Image {
                id: networkIcon
                anchors.fill: parent
                source: "../images/network_settings-icon.svg"
                fillMode:Image.PreserveAspectFit
            }
            MouseArea {
            anchors.fill: parent
            onClicked: pageStack.push(Qt.resolvedUrl("PageNetworkSettings.qml"))
            }
        }

    }
}
