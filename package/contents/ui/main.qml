/*
    SPDX-FileCopyrightText: %{CURRENT_YEAR} %{AUTHOR} <%{EMAIL}>
    SPDX-License-Identifier: LGPL-2.1-or-later
*/

import QtQuick 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import QtQml 2.2

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 3.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras

import "./lib"

Item {
    id: root

    JsonLoader {
        id: jsonloader
        source: plasmoid.configuration.dataConfigPath
    }

    Plasmoid.preferredRepresentation: Plasmoid.fullRepresentation
    Plasmoid.backgroundHints: PlasmaCore.Types.ConfigurableBackground

    Timer {
        interval: plasmoid.configuration.switchTime * 1000
        running: true
        repeat: true
        onTriggered: setDisplayText()
    }

    property int idx

    function setDisplayText() {
        idx++;
        idx %= jsonloader.jsonObject.length;
    }

    Plasmoid.fullRepresentation: ColumnLayout {
        Layout.preferredWidth: 120 * PlasmaCore.Units.devicePixelRatio
        Layout.preferredHeight: 120 * PlasmaCore.Units.devicePixelRatio


        anchors.fill: parent
        spacing: 50

        TextMetrics {
            Layout.fillHeight: true
            id: nameMetricsLabel
            font.family: nameLabel.font.family
            font.pixelSize: nameLabel.font.pixelSize
            text: ""
        }

        TextMetrics {
            Layout.fillHeight: true
            id: dateMetricsLabel
            font.family: dateLabel.font.family
            font.pixelSize: dateLabel.font.pixelSize
            text: ""
        }

        TextMetrics {
            Layout.fillHeight: true
            id: countdownMetricsLabel
            font.family: countdownLabel.font.family
            font.pixelSize: countdownLabel.font.pixelSize
            text: ""
        }

        Item {
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignCenter

            Text {
                id: nameLabel
                anchors.centerIn: parent

                color: plasmoid.configuration.nameFontColor
                font.family: plasmoid.configuration.nameFontFamily
                font.pixelSize: plasmoid.configuration.nameFontSize

                property var name: {
                    return jsonloader.jsonObject[idx].name;
                }
                text: name
            }
        }

        Item {
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignCenter
            Text {
                id: dateLabel
                anchors.centerIn: parent

                color: plasmoid.configuration.dateFontColor
                font.family: plasmoid.configuration.dateFontFamily
                font.pixelSize: plasmoid.configuration.dateFontSize

                property var date_: {
                    return jsonloader.jsonObject[idx].date;
                }
                text: date_
            }
        }

        Item {
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignCenter
            Text {
                id: countdownLabel
                anchors.centerIn: parent

                color: plasmoid.configuration.countdownFontColor
                font.family: plasmoid.configuration.countdownFontFamily
                font.pixelSize: plasmoid.configuration.countdownFontSize

                property var countdown: {
                    let d_str = jsonloader.jsonObject[idx].date;
                    let arr = d_str.split("/");
                    let d = new Date(parseInt(arr[0]), parseInt(arr[1]) - 1, parseInt(arr[2]), 0, 0, 0, 0)
                    let current_date = new Date();
                    let delta = (d - current_date) / 1000 / 60 / 60 / 24;
                    if (delta > 0) {
                        delta += 1.00;
                    }

                    return "倒數" + parseInt(delta) + "天";
                }
                text: countdown
            }
        }
    }
}
