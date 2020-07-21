import QtQuick 2.7
import org.kde.kirigami 2.5 as Kirigami
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import GHLogin 0.1

Kirigami.Page
{
id: loginPage
title: qsTr("Login")

    GHLogin { // FedLogin object registered at main.py to be used here
        id: ghlogin
        onLoginOK: {
            pageStack.push(Qt.resolvedUrl("PagePhr.qml"))
        }
    }

    Kirigami.FormLayout {
        id: content
        anchors.fill: parent

        Image {
            id: padlockicon
            Layout.fillWidth: true
            anchors.centerIn: parent
            fillMode: Image.PreserveAspectFit
            source: "../images/padlock-icon.svg"

        }

        TextField {
            id: txtKey
            placeholderText: qsTr("Secret Key")
            anchors.top: padlockicon.bottom
            anchors.horizontalCenter: padlockicon.horizontalCenter

            // Kirigami.FormData.label: qsTr("Key")
            echoMode: TextInput.Password
            focus: true
            onAccepted: {
                ghlogin.getKey(txtKey.text);
            }
        }

        Button {
            id: buttonKey
            anchors.horizontalCenter: txtKey.horizontalCenter
            anchors.top: txtKey.bottom
            text: qsTr("Enter")
            flat: false
            onClicked: {
                ghlogin.getKey(txtKey.text);
            }

        }
    }
}
