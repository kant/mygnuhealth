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

    ColumnLayout {
        id: content
        anchors.centerIn: parent
        spacing: 20
        Image {
            id: padlockicon
            Layout.alignment: Qt.AlignHCenter
            source: "../images/padlock-icon.svg"

        }
        TextField {
            id: txtKey
            Layout.alignment: Qt.AlignHCenter
            placeholderText: qsTr("Key")
            horizontalAlignment: TextInput.AlignHCenter
            echoMode: TextInput.Password
            focus: true
            onAccepted: {
                ghlogin.getKey(txtKey.text);
            }
        }

        Button {
            id: buttonKey
            Layout.alignment: Qt.AlignHCenter
            text: qsTr("Enter")
            flat: false
            onClicked: {
                ghlogin.getKey(txtKey.text);
            }

        }
    }
}
