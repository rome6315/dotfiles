import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.Matugen

PanelWindow {
    id: win

    property var service  // inject UpdateService

    visible: true

    color: Colors.md3.surface_container
    implicitWidth: 300
    implicitHeight: Math.min(column.implicitHeight + 24, 400) // window stops growing at 400px

    Item {
        anchors.fill: parent
        anchors.margins: 12

        // scroll or click and drag through the list
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
                    model: win.service.updates

                    // each rectangle is the space for a package name
                    delegate: Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 28
                        color: "transparent"

                        // how the text will look
                        Text {
                            anchors.centerIn: parent
                            text: modelData
                            color: Colors.md3.tertiary
                            font {
                                family: "Iosevka Nerd Font Bold"
                                pixelSize: 14
                                weight: 600
                            }
                        }
                    }
                }
            }
        }
    }
}
