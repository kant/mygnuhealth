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

        TextField {
            id: txtKey
            placeholderText: qsTr("Secret Key")
            Kirigami.FormData.label: qsTr("Key")
            echoMode: TextInput.Password
            onAccepted: {
                ghlogin.getKey(txtKey.text);
            }
        }

        Button {
            text: qsTr("Enter")
            flat: false
            Layout.alignment: Qt.AlignHCenter
            onClicked: {
                ghlogin.getKey(txtKey.text);
            }
        }
    }
}
