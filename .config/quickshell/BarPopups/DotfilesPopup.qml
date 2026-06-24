import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.Matugen

PanelWindow {
    id: win

    property var service

    visible: true

    color: Colors.md3.surface_container // bg color
    implicitWidth: 400
    implicitHeight: Math.min(column.implicitHeight + 24, 400) // height will dynamically adjust up to 400 px

    Item {
        anchors.fill: parent
        anchors.margins: 12

        // allow for scrolling or dragging if list is long
        Flickable {
            id: flick

            anchors.fill: parent
            clip: true

            contentHeight: column.implicitHeight
            boundsBehavior: Flickable.StopAtBounds

            ColumnLayout {
                id: column

                width: flick.width
                spacing: 6

                Repeater {
                    model: win.service.files

                    delegate: Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 28

                        color: "transparent"

                        Text {
                            anchors.centerIn: parent

                            text: modelData
                            color: Colors.md3.primary

                            font {
                                family: "Iosevka Nerd Font Bold"
                                pixelSize: 14
                                weight: 600
                            }

                            // optional if some paths are long
                            elide: Text.ElideMiddle
                            width: parent.width
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }
                }
            }
        }
    }
}
