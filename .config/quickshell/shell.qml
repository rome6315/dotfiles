import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import qs.Matugen
import qs.Services

ShellRoot {

    // notification server and popups
    Notifications {}

    // create instance of the UpdatesService
    UpdatesService {
        id: updatesService
    }

    // create instance of DotfilesService
    DotfilesService {
        id: dotfilesService
    }

    Variants {
        model: Quickshell.screens // display bar across all screens

        PanelWindow {
            required property var modelData // display bar across all screens
            screen: modelData // display bar across all screens

            anchors {
                top: true
                left: false
                right: false
            }

            margins {
                top: 8
                bottom: 8
            }

            // bar width and height
            implicitHeight: 38
            implicitWidth: 700
            color: "transparent" // without this, the bar color leaks through the edges of the bar radius

            // rectangle allows for border radius on the bar
            Rectangle {
                anchors.fill: parent
                color: Colors.md3.surface_container
                radius: 10

                // arrange the modules of the bar in a row layout
                RowLayout {
                    anchors.fill: parent // fill the rectangle (parent)
                    // set margins for the leftmost and rightmost modules so they aren't touching the edge of the bar
                    anchors.leftMargin: 14
                    anchors.rightMargin: 14

                    spacing: 12 // margins between each module

                    Powermenu {}

                    Updates {
                        service: updatesService // receive reference to the UpdatesService.qml process and read service.count from Updates.qml
                    }

                    Dotfiles {
                        service: dotfilesService // receive reference to the DotfilesService.qml process and read unstaged count from Dotfiles.qml
                    }

                    // fill the space between the first 3 modules and workspaces module
                    Item {
                        Layout.fillWidth: true
                    }

                    Workspaces {
                        screen: modelData
                    }

                    // fill the space between worspaces module and the last 3 modules
                    Item {
                        Layout.fillWidth: true
                    }

                    Volume {}

                    Network {}

                    Clock {}
                }
            }
        }
    }
}
