import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import org.kde.kirigami 2.5 as Kirigami
import GHBio 0.1

Kirigami.Page
{
id: biopage
title: qsTr("GNU Health - BIO")

    GHBio { // GHBio object registered at main.py
        id: ghbio
    }

    ColumnLayout {
        spacing: 5

        // Blood pressure / Heart Rate
        Rectangle {
            id:bpitem
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 350
            Layout.preferredHeight: 100

            Rectangle {
                id:bprectangle
                width: 100
                height: 100

                Image {
                    id: bpIcon
                    source: "../images/bp-icon.svg"
                    anchors.fill: parent
                    fillMode:Image.PreserveAspectFit
                    MouseArea {
                        anchors.fill: parent
                        onClicked: pageStack.push(Qt.resolvedUrl("PageBloodpressure.qml"))
                    }
                }
            }
            Rectangle {
                id:bphistoryrectangle
                width: 250
                height: 100
                // Layout.preferredWidth does not work here.
                anchors.left: bprectangle.right
                    Text {
                        id: txtBp
                        anchors.centerIn: parent
                        property var bpinfo: ghbio.bp
                        property var bpdate: bpinfo[0]
                        property var bpsystolic: bpinfo[1]
                        property var bpdiastolic: bpinfo[2]
                        property var hearrate: bpinfo[3]
                        text: bpdate
                        color: "#108498"
                        font.pointSize: 12
                    }
                MouseArea {
                anchors.fill: parent
                onClicked: pageStack.push(Qt.resolvedUrl("PageBioBPChart.qml"))
                }

            }
        }

        Kirigami.Separator {
            Layout.fillWidth: true
            height: 15
            visible: true
        }

        // GLUCOSE

        Rectangle {
            id:glucoseitem
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 350
            Layout.preferredHeight: 100
            Rectangle {
                id:glucoserectangle
                width: 100
                height: 100

                Image {
                    id: glucoseIcon
                    source: "../images/glucose-icon.svg"
                    anchors.fill: parent
                    fillMode:Image.PreserveAspectFit
               }
            }
            Rectangle {
                id:glucosehistoryrectangle
                width: 250
                height: 100
                anchors.left: glucoserectangle.right
                    Text {
                        id: txtGlucose
                        anchors.centerIn: parent
                        // property var glucoseinfo: ghbio.glucose
                        text: "96 mg/dL (TODO)"
                        color: "#108498"
                        font.pointSize: 12
                    }

            }
        }

        Kirigami.Separator {
            Layout.fillWidth: true
            height: 15
            visible: true
        }

        // WEIGHT

        Rectangle {
            id:weightitem
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 350
            Layout.preferredHeight: 100
            Rectangle {
                id:weightrectangle
                width: 100
                height: 100

                Image {
                    id: weightIcon
                    source: "../images/weight-icon.svg"
                    anchors.fill: parent
                    fillMode:Image.PreserveAspectFit
               }
            }
            Rectangle {
                id:weighthistoryrectangle
                width: 250
                height: 100
                anchors.left: weightrectangle.right
                    Text {
                        id: txtWeight
                        anchors.centerIn: parent
                        // property var weightinfo: ghbio.weight
                        text: "90.3 Kg (TODO)"
                        color: "#108498"
                        font.pointSize: 12
                    }
            }
        }

        Kirigami.Separator {
            Layout.fillWidth: true
            height: 15
            visible: true
        }

        // OSAT

        Rectangle {
            id:osatitem
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 350
            Layout.preferredHeight: 100
            Rectangle {
                id:osatrectangle
                width: 100
                height: 100

                Image {
                    id: osatIcon
                    source: "../images/osat-icon.svg"
                    anchors.fill: parent
                    fillMode:Image.PreserveAspectFit
               }
            }
            Rectangle {
                id:osathistoryrectangle
                width: 250
                height: 100
                anchors.left: osatrectangle.right
                    Text {
                        id: txtOsat
                        anchors.centerIn: parent
                        // property var osatinfo: ghbio.osat
                        text: "98% (TODO)"
                        color: "#108498"
                        font.pointSize: 12
                    }

            }
        }

    }

    actions.main: Kirigami.Action {
        text: qsTr("Logout")
        onTriggered: {
            // Clear the stack and go to the initial page
            pageStack.clear()
            pageStack.push(Qt.resolvedUrl("PageInitial.qml"))
        }
    }
}
