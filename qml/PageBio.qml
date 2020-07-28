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
                id:bphist
                width: 250
                height: 100
                // Layout.preferredWidth does not work here.
                anchors.left: bprectangle.right
                property var bpinfo: ghbio.bp
                property var bpdate: bpinfo[0]
                property var bpsystolic: bpinfo[1]
                property var bpdiastolic: bpinfo[2]
                property var heartrate: bpinfo[3] + ' bpm'

                MouseArea {
                anchors.fill: parent
                onClicked: pageStack.push(Qt.resolvedUrl("PageBioBPChart.qml"))
                }

                Text {
                    id: txtBpdate
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin:5
                    text: bphist.bpdate
                    color: "#108498"
                    font.pointSize: 10
                }

                Text {
                    id: txtBp
                    anchors.centerIn: parent
                    text: bphist.bpsystolic + ' / ' + bphist.bpdiastolic
                    color: "#108498"
                    font.bold: true
                    font.pointSize: 12
                    }

                Text {
                    id: txtHr
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: bphist.heartrate
                    color: "#108498"
                    font.pointSize: 10
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
                    MouseArea {
                        anchors.fill: parent
                        onClicked: pageStack.push(Qt.resolvedUrl("PageGlucose.qml"))
                    }
               }
            }

            Rectangle {
                id:glucosehist
                width: 250
                height: 100
                property var glucoseinfo: ghbio.glucose
                property var glucosedate: glucoseinfo[0]
                property var glucose: glucoseinfo[1]

                anchors.left: glucoserectangle.right

                MouseArea {
                anchors.fill: parent
                onClicked: pageStack.push(Qt.resolvedUrl("PageBioGlucoseChart.qml"))
                }

                Text {
                    id: txtGlucoseDate
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin:5
                    text: glucosehist.glucosedate
                    color: "#108498"
                    font.pointSize: 10
                }

                Text {
                    id: txtGlucose
                    anchors.centerIn: parent
                    text: glucosehist.glucose + ' mg/dl'
                    horizontalAlignment: TextInput.AlignHCenter
                    color: "#108498"
                    font.bold: true
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
                    MouseArea {
                        anchors.fill: parent
                        onClicked: pageStack.push(Qt.resolvedUrl("PageWeight.qml"))
                    }
               }
            }

            Rectangle {
                id:weighthist
                width: 250
                height: 100
                property var weightinfo: ghbio.weight
                property var weightdate: weightinfo[0]
                property var weight: weightinfo[1]

                anchors.left: weightrectangle.right

                MouseArea {
                anchors.fill: parent
                onClicked: pageStack.push(Qt.resolvedUrl("PageBioWeightChart.qml"))
                }

                Text {
                    id: txtWeightDate
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin:5
                    text: weighthist.weightdate
                    color: "#108498"
                    font.pointSize: 10
                }

                Text {
                    id: txtWeight
                    anchors.centerIn: parent
                    text: weighthist.weight + ' kg'
                    horizontalAlignment: TextInput.AlignHCenter
                    color: "#108498"
                    font.bold: true
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
                    MouseArea {
                        anchors.fill: parent
                        onClicked: pageStack.push(Qt.resolvedUrl("PageOsat.qml"))
                    }
               }
            }

            Rectangle {
                id:osathist
                width: 250
                height: 100
                property var osatinfo: ghbio.osat
                property var osatdate: osatinfo[0]
                property var osat: osatinfo[1]

                anchors.left: osatrectangle.right

                MouseArea {
                anchors.fill: parent
                onClicked: pageStack.push(Qt.resolvedUrl("PageBioOsatChart.qml"))
                }

                Text {
                    id: txtOsatDate
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin:5
                    text: osathist.osatdate
                    color: "#108498"
                    font.pointSize: 10
                }

                Text {
                    id: txtOsat
                    anchors.centerIn: parent
                    text: osathist.osat + ' %'
                    horizontalAlignment: TextInput.AlignHCenter
                    color: "#108498"
                    font.bold: true
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
