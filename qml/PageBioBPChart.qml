import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import org.kde.kirigami 2.5 as Kirigami
import org.kde.quickcharts 1.0 as Charts

Kirigami.Page
{
id: bphist
title: qsTr("GNU Health - BP History")

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
                nameSource: Charts.ArraySource { array: ["sysolic", "diastolic"] }
                valueSources: [
                    Charts.ArraySource { array: [120, 130, 112] },
                    Charts.ArraySource { array: [83, 86, 74] }
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
                    Charts.ArraySource { array: [74, 112, 86] }
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

