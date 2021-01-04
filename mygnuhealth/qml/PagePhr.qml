import QtQuick 2.7
import org.kde.kirigami 2.5 as Kirigami
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3


Kirigami.ScrollablePage
{
    id: phrpage
    ColumnLayout {
        spacing: 10
        Rectangle {
            id:biorectangle
            color: "#108498"
            Layout.alignment: Qt.AlignCenter
            Layout.fillWidth: true
            Layout.preferredHeight: 100
            radius: 10

            Image {
                id: bioIcon
                anchors.fill: parent
                source: "../images/bio-icon.svg"
                fillMode:Image.PreserveAspectFit
            }
            MouseArea {
            anchors.fill: parent
            onClicked: pageStack.push(Qt.resolvedUrl("PageBio.qml"))
            }
        }
        Rectangle {
            id:bolrectangle
            color: "#108498"
            Layout.alignment: Qt.AlignCenter
            Layout.fillWidth: true
            Layout.preferredHeight: 100

            radius: 10

            Image {
                id: bolIcon
                anchors.fill: parent
                source: "../images/book_of_life-icon.svg"
                fillMode:Image.PreserveAspectFit
            }
            MouseArea {
            anchors.fill: parent
            onClicked: pageStack.push(Qt.resolvedUrl("PageBol.qml"))
            }
        }

        Rectangle {
            id:documentsrectangle
            color: "#108498"
            Layout.alignment: Qt.AlignCenter
            Layout.fillWidth: true
            Layout.preferredHeight: 100

            radius: 10

            Image {
                id: documentsIcon
                anchors.fill: parent
                source: "../images/documents-icon.svg"
                fillMode:Image.PreserveAspectFit
            }
            /*
            MouseArea {
            anchors.fill: parent
            onClicked: pageStack.push(Qt.resolvedUrl("PageDocuments.qml"))
            }
            */
        }

        Rectangle {
            id:emergencyrectangle
            color: "#108498"
            Layout.alignment: Qt.AlignCenter
            Layout.fillWidth: true
            Layout.preferredHeight: 100
            radius: 10

            Image {
                id: emergencyIcon
                anchors.fill: parent
                source: "../images/emergency-icon.svg"
                fillMode:Image.PreserveAspectFit
            }
            /*
            MouseArea {
            anchors.fill: parent
            onClicked: pageStack.push(Qt.resolvedUrl("SocialPsycho.qml"))
            }
            */
        }

    }
}
