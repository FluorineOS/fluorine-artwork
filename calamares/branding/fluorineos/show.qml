/* SPDX-License-Identifier: GPL-3.0-or-later */
/*
 * show.qml -- Calamares slideshow for FluorineOS 0.3.0
 * Slideshow API version 2.
 *
 * Design: AMOLED Void.
 *   canvas        #000000
 *   panel         #0A0D10
 *   hairline      #1C2229
 *   accent        #B4F03A
 *   primary text  #E2E8F0
 *   muted text    #6E7681
 *
 * Three slides, plain ASCII, no emojis.
 */

import QtQuick 2.15
import io.calamares.ui 1.0

Presentation {
    id: presentation

    // Slide 1: workspace and core keybindings.
    Slide {
        anchors.fill: parent

        Rectangle {
            anchors.fill: parent
            color: "#000000"

            Column {
                anchors.centerIn: parent
                spacing: 20

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Workspace"
                    font.family: "Inter, sans-serif"
                    font.pixelSize: 28
                    font.weight: Font.Bold
                    color: "#B4F03A"
                }

                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 360
                    height: 2
                    color: "#1C2229"
                }

                Rectangle {
                    width: 520
                    height: 168
                    color: "#0A0D10"
                    border.width: 2
                    border.color: "#1C2229"

                    Grid {
                        anchors.centerIn: parent
                        columns: 2
                        columnSpacing: 40
                        rowSpacing: 16

                        Text { text: "SUPER + Return"; font.family: "JetBrains Mono, monospace"; font.pixelSize: 14; color: "#B4F03A" }
                        Text { text: "Open the terminal"; font.family: "Inter, sans-serif"; font.pixelSize: 14; color: "#E2E8F0" }

                        Text { text: "SUPER + D"; font.family: "JetBrains Mono, monospace"; font.pixelSize: 14; color: "#B4F03A" }
                        Text { text: "Open the application launcher"; font.family: "Inter, sans-serif"; font.pixelSize: 14; color: "#E2E8F0" }

                        Text { text: "SUPER + Escape"; font.family: "JetBrains Mono, monospace"; font.pixelSize: 14; color: "#B4F03A" }
                        Text { text: "Open the system menu"; font.family: "Inter, sans-serif"; font.pixelSize: 14; color: "#E2E8F0" }
                    }
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 520
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignHCenter
                    text: "Workspaces occupy SUPER + 1 through 9, and SUPER + Shift moves the focused window between them."
                    font.family: "Inter, sans-serif"
                    font.pixelSize: 13
                    color: "#6E7681"
                }
            }
        }
    }

    // Slide 2: configuration files.
    Slide {
        anchors.fill: parent

        Rectangle {
            anchors.fill: parent
            color: "#000000"

            Column {
                anchors.centerIn: parent
                spacing: 20

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Configuration"
                    font.family: "Inter, sans-serif"
                    font.pixelSize: 28
                    font.weight: Font.Bold
                    color: "#B4F03A"
                }

                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 360
                    height: 2
                    color: "#1C2229"
                }

                Rectangle {
                    width: 520
                    height: 132
                    color: "#0A0D10"
                    border.width: 2
                    border.color: "#1C2229"

                    Grid {
                        anchors.centerIn: parent
                        columns: 2
                        columnSpacing: 40
                        rowSpacing: 16

                        Text { text: "~/.config/hypr/"; font.family: "JetBrains Mono, monospace"; font.pixelSize: 14; color: "#B4F03A" }
                        Text { text: "Compositor, idle policy, lock screen"; font.family: "Inter, sans-serif"; font.pixelSize: 14; color: "#E2E8F0" }

                        Text { text: "~/.config/waybar/"; font.family: "JetBrains Mono, monospace"; font.pixelSize: 14; color: "#B4F03A" }
                        Text { text: "Bar layout and styling"; font.family: "Inter, sans-serif"; font.pixelSize: 14; color: "#E2E8F0" }
                    }
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 520
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignHCenter
                    text: "Every surface is a plain text file. The compositor reads hyprland.lua, and edits apply after hyprctl reload or the next login."
                    font.family: "Inter, sans-serif"
                    font.pixelSize: 13
                    color: "#6E7681"
                }
            }
        }
    }

    // Slide 3: maintenance.
    Slide {
        anchors.fill: parent

        Rectangle {
            anchors.fill: parent
            color: "#000000"

            Column {
                anchors.centerIn: parent
                spacing: 20

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Maintenance"
                    font.family: "Inter, sans-serif"
                    font.pixelSize: 28
                    font.weight: Font.Bold
                    color: "#B4F03A"
                }

                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 360
                    height: 2
                    color: "#1C2229"
                }

                Rectangle {
                    width: 520
                    height: 168
                    color: "#0A0D10"
                    border.width: 2
                    border.color: "#1C2229"

                    Grid {
                        anchors.centerIn: parent
                        columns: 2
                        columnSpacing: 40
                        rowSpacing: 16

                        Text { text: "flr-update"; font.family: "JetBrains Mono, monospace"; font.pixelSize: 14; color: "#B4F03A" }
                        Text { text: "Refresh the index and upgrade"; font.family: "Inter, sans-serif"; font.pixelSize: 14; color: "#E2E8F0" }

                        Text { text: "flr-doctor"; font.family: "JetBrains Mono, monospace"; font.pixelSize: 14; color: "#B4F03A" }
                        Text { text: "Report session and repository health"; font.family: "Inter, sans-serif"; font.pixelSize: 14; color: "#E2E8F0" }

                        Text { text: "apt upgrade"; font.family: "JetBrains Mono, monospace"; font.pixelSize: 14; color: "#B4F03A" }
                        Text { text: "Standard Debian upgrade path"; font.family: "Inter, sans-serif"; font.pixelSize: 14; color: "#E2E8F0" }
                    }
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 520
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignHCenter
                    text: "Installation is nearly complete. The system reboots into the greetd login prompt when the copy finishes."
                    font.family: "Inter, sans-serif"
                    font.pixelSize: 13
                    color: "#6E7681"
                }
            }
        }
    }

    Timer {
        interval: 6000
        running: true
        repeat: true
        onTriggered: presentation.goToNextSlide()
    }
}
