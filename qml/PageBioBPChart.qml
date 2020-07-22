import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import org.kde.kirigami 2.5 as Kirigami
// import org.kde.quickcharts 1.0 as Charts
import GHBio 0.1

Kirigami.Page
{
id: bphist
title: qsTr("GNU Health - BP History")
    GHBio { // GHBio object registered at main.py
        id: ghbio
    }

    ColumnLayout {
        spacing: 50
        Layout.fillWidth: true
        Layout.fillHeight: true

        Rectangle {
            id: bphistchart
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 350
            Layout.preferredHeight: 200
            border.width: 1
            border.color: "#108498"

            Image {
                id:bphistplot
                width: 350
                source: ghbio.bpplot
                fillMode: Image.PreserveAspectFit
            }
       }


        Rectangle {
            id: hrhistchart
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 350
            Layout.preferredHeight: 100
            border.width: 1
            border.color: "#108498"

            Image {
                id:hrhistplot
                width: 350
                source: ghbio.hrplot
                fillMode: Image.PreserveAspectFit

            }
       }

    }
}

