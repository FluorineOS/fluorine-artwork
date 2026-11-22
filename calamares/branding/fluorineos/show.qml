/* SPDX-License-Identifier: GPL-3.0-or-later */
/*
 * show.qml -- Calamares slideshow for FluorineOS 0.0.1
 * Slideshow API version 2.
 * Design: AMOLED Void -- #000000 background, #B4F03A accent, #E2E8F0 text.
 * Plain ASCII only. No emojis.
 */

import QtQuick 2.15
import io.calamares.ui 1.0

Presentation {
    id: presentation

    // Slide 1: Welcome
    Slide {
        anchors.fill: parent

        Rectangle {
            anchors.fill: parent
            color: "#000000"

            Column {
                anchors.centerIn: parent
                spacing: 24

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "FluorineOS 0.0.1"
                    font.family: "Inter, sans-serif"
                    font.pixelSize: 32
                    font.weight: Font.Bold
                    color: "#B4F03A"
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Debian 13 Trixie  |  Hyprland 0.55+  |  x86_64"
                    font.family: "Inter, sans-serif"
                    font.pixelSize: 14
                    color: "#6E7681"
                    letterSpacing: 1
                }

                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 320
                    height: 1
                    color: "#1C2229"
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 480
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignHCenter
                    text: "FluorineOS is a Debian 13 workstation built on Hyprland 0.55 " +
                          "with an AMOLED Void visual design. Installation is in progress."
                    font.family: "Inter, sans-serif"
                    font.pixelSize: 13
                    color: "#E2E8F0"
                    lineHeight: 1.5
                }
            }
        }
    }

    // Slide 2: Desktop environment
    Slide {
        anchors.fill: parent

        Rectangle {
            anchors.fill: parent
            color: "#000000"

            Column {
                anchors.centerIn: parent
                spacing: 24

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Hyprland 0.55+"
                    font.family: "Inter, sans-serif"
                    font.pixelSize: 28
                    font.weight: Font.Bold
                    color: "#B4F03A"
                }

                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 320
                    height: 1
                    color: "#1C2229"
                }

                Grid {
                    anchors.horizontalCenter: parent.horizontalCenter
                    columns: 2
                    columnSpacing: 32
                    rowSpacing: 12

                    Text { text: "Compositor"; font.pixelSize: 13; color: "#6E7681"; font.family: "Inter, sans-serif" }
                    Text { text: "Hyprland 0.55+ (trixie-backports)"; font.pixelSize: 13; color: "#E2E8F0"; font.family: "Inter, sans-serif" }

                    Text { text: "Bar"; font.pixelSize: 13; color: "#6E7681"; font.family: "Inter, sans-serif" }
                    Text { text: "Waybar"; font.pixelSize: 13; color: "#E2E8F0"; font.family: "Inter, sans-serif" }

                    Text { text: "Terminal"; font.pixelSize: 13; color: "#6E7681"; font.family: "Inter, sans-serif" }
                    Text { text: "kitty"; font.pixelSize: 13; color: "#E2E8F0"; font.family: "Inter, sans-serif" }

                    Text { text: "Launcher"; font.pixelSize: 13; color: "#6E7681"; font.family: "Inter, sans-serif" }
                    Text { text: "Fuzzel"; font.pixelSize: 13; color: "#E2E8F0"; font.family: "Inter, sans-serif" }

                    Text { text: "Notifications"; font.pixelSize: 13; color: "#6E7681"; font.family: "Inter, sans-serif" }
                    Text { text: "SwayNotificationCenter"; font.pixelSize: 13; color: "#E2E8F0"; font.family: "Inter, sans-serif" }

                    Text { text: "Display Manager"; font.pixelSize: 13; color: "#6E7681"; font.family: "Inter, sans-serif" }
                    Text { text: "greetd + tuigreet"; font.pixelSize: 13; color: "#E2E8F0"; font.family: "Inter, sans-serif" }
                }
            }
        }
    }

    // Slide 3: Design and packages
    Slide {
        anchors.fill: parent

        Rectangle {
            anchors.fill: parent
            color: "#000000"

            Column {
                anchors.centerIn: parent
                spacing: 24

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "AMOLED Void Design"
                    font.family: "Inter, sans-serif"
                    font.pixelSize: 28
                    font.weight: Font.Bold
                    color: "#B4F03A"
                }

                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 320
                    height: 1
                    color: "#1C2229"
                }

                Grid {
                    anchors.horizontalCenter: parent.horizontalCenter
                    columns: 2
                    columnSpacing: 32
                    rowSpacing: 12

                    Text { text: "Background"; font.pixelSize: 13; color: "#6E7681"; font.family: "monospace" }
                    Text { text: "#000000"; font.pixelSize: 13; color: "#E2E8F0"; font.family: "monospace" }

                    Text { text: "Surface"; font.pixelSize: 13; color: "#6E7681"; font.family: "monospace" }
                    Text { text: "#0A0D10"; font.pixelSize: 13; color: "#E2E8F0"; font.family: "monospace" }

                    Text { text: "Accent"; font.pixelSize: 13; color: "#6E7681"; font.family: "monospace" }
                    Text { text: "#B4F03A"; font.pixelSize: 13; color: "#B4F03A"; font.family: "monospace" }

                    Text { text: "Text"; font.pixelSize: 13; color: "#6E7681"; font.family: "monospace" }
                    Text { text: "#E2E8F0"; font.pixelSize: 13; color: "#E2E8F0"; font.family: "monospace" }
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 480
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignHCenter
                    text: "Installation is almost complete. The system will be ready shortly."
                    font.family: "Inter, sans-serif"
                    font.pixelSize: 13
                    color: "#6E7681"
                    lineHeight: 1.5
                }
            }
        }
    }

    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: presentation.goToNextSlide()
    }
}
