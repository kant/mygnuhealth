import QtQuick 2.7
import org.kde.kirigami 2.5 as Kirigami
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import ProfileSettings 0.1

Kirigami.Page
{
id: phrpage
title: qsTr("MyGNUHealth Profile Settings")

    ProfileSettings { // ProfileSettings object registered at main.py
        id: profile_settings
        onSetOK: {
            pageStack.pop() // Return to main PHR page
        }
    }

    Kirigami.FormLayout {
        id: content
        anchors.fill: parent

        TextField {
            id: txtUserPassword
            Layout.alignment: Qt.AlignHCenter
            placeholderText: qsTr("Key")
            horizontalAlignment: TextInput.AlignHCenter
            echoMode: TextInput.Password
            focus: true
            //onAccepted: {
            //    network_settings.getKey(txtUserPassword.text);
            //}
        }


        Button {
            id: buttonSetSettings
            Layout.alignment: Qt.AlignHCenter

            text: qsTr("Done")
            flat: false
            onClicked: {
                profile_settings.getvals(txtUserPassword.text);
            }

        }

    }

}
