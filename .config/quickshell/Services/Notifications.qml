import Quickshell
import Quickshell.Wayland
import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Layouts
import qs.Matugen

Scope {
    id: root

    // notification daemon
    NotificationServer {
        id: server
        actionsSupported: true
        bodySupported: true // support the actual text of the notification
        imageSupported: true // support images in the notification

        onNotification: n => {
            console.log("got:", n.summary, "---", n.body);
            n.tracked = true;
        }
    }

    PanelWindow {
        // where notification will popup
        anchors {
            top: true
            right: true
        }
        margins {
            top: 50
            right: 12
        }

        implicitWidth: 380
        implicitHeight: Math.max(1, column.implicitHeight)
        color: "transparent"

        exclusionMode: ExclusionMode.Ignore

        ColumnLayout {
            id: column
            width: parent.width
            spacing: 10

            Repeater {
                model: server.trackedNotifications
                delegate: Rectangle {
                    id: card
                    required property var modelData

                    // timeout after 5 seconds
                    Timer {
                        running: true
                        interval: 5000
                        onTriggered: card.modelData.dismiss()
                    }

                    Layout.fillWidth: true
                    Layout.preferredHeight: 60 //layout.implicitHeight + 20
                    radius: 6
                    color: Colors.md3.surface_container
                    border.width: 2
                    border.color: modelData.urgency === NotificationUrgency.Critical ? Colors.md3.error : Colors.md3.primary

                    RowLayout {
                        id: layout
                        anchors.fill: parent
                        anchors.margins: 10
                        spacing: 10

                        Image {
                            Layout.preferredHeight: 36
                            Layout.preferredWidth: 36
                            Layout.alignment: Qt.AlignTop
                            fillMode: Image.PreserveAspectFit
                            visible: source.toString() !== "" // visible if source is not empty
                            source: card.modelData.image || card.modelData.appIcon || ""
                        }

                        ColumnLayout {
                            Layout.fillWidth: true
                            spacing: 2

                            // header
                            Text {
                                Layout.fillWidth: true
                                text: card.modelData.summary
                                color: Colors.md3.tertiary
                                elide: Text.ElideRight
                                font {
                                    family: "Iosevka Nerd Font Bold"
                                    pixelSize: 17
                                    weight: 600
                                }
                            }

                            // body
                            Text {
                                Layout.fillWidth: true
                                visible: text !== ""
                                text: card.modelData.body
                                color: Colors.md3.tertiary
                                wrapMode: Text.WordWrap
                                font {
                                    family: "Iosevka Nerd Font Bold"
                                    pixelSize: 15
                                    weight: 500
                                }
                            }
                        }
                    }

                    // click to dismiss
                    MouseArea {
                        anchors.fill: parent
                        onClicked: card.modelData.dismiss()
                    }
                }
            }
        }
    }
}
