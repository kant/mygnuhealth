import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import org.kde.kirigami 2.5 as Kirigami
import org.kde.quickcharts 1.0 as Charts
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

        Rectangle {
            id: bphistchart
            Layout.alignment: Qt.AlignCenter
            width: 350
            height: 200
            border.width: 1
            border.color: "#108498"

            Charts.LineChart {
                id:bpchart
                anchors.fill: parent
                colorSource: Charts.ArraySource { array: ["red", "blue"] }
                nameSource: Charts.ArraySource { array: ["systolic", "diastolic"] }
                valueSources: [
                    Charts.ArraySource { array: ghbio.bphist[0] },
                    Charts.ArraySource { array: ghbio.bphist[1] }
                ]
            }
            Text {
                id:bphistlabel
                anchors.bottom: bpchart.top
                anchors.horizontalCenter: bpchart.horizontalCenter
                text: "Blood Pressure"
                color: "#108498"
                font.pointSize: 12
            }
        }

        Rectangle {
            id: hrhistchart
            Layout.alignment: Qt.AlignCenter
            width: 350
            height: 200
            border.width: 1
            border.color: "#108498"

            Charts.LineChart {
                id:hrchart
                anchors.fill: parent
                colorSource: Charts.ArraySource { array: ["black"]}
                nameSource: Charts.ArraySource { array: ["Rate"]}
                valueSources: [
                    Charts.ArraySource { array: ghbio.bphist[2] }
                ]
            }
            Text {
                id:hrhistlabel
                anchors.bottom: hrchart.top
                anchors.horizontalCenter: hrchart.horizontalCenter
                text: "Heart Rate"
                color: "#108498"
                font.pointSize: 12
            }
        }
    }
}

