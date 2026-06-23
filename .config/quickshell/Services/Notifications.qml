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
        actionsSupported: true // supports things like clicking buttons
        bodySupported: true // support the actual text of the notification
        imageSupported: true // support images in the notification

        onNotification: n => {
            console.log("got:", n.summary, "---", n.body); // debugging
            n.tracked = true; // keep notification around so we can display it
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
        implicitHeight: Math.max(1, column.implicitHeight) // grows/shrinks based on notification content
        color: "transparent" // if this isn't transparent, we'd see the panelwindow too, but we only want the notification box

        exclusionMode: ExclusionMode.Ignore // make popup float (don't reserve space)

        // stack notifications vertically by using ColumnLayout if multiple come in
        ColumnLayout {
            id: column
            width: parent.width
            spacing: 10

            Repeater {
                model: server.trackedNotifications // create one card per notification
                delegate: Rectangle { // define what a notification should look like, each notification gets a rectangle (card)
                    id: card
                    required property var modelData // the actual notification

                    // timeout after 5 seconds
                    Timer {
                        running: true
                        interval: 5000
                        onTriggered: card.modelData.dismiss() // removes the notification
                    }

                    Layout.fillWidth: true
                    Layout.preferredHeight: 60 //layout.implicitHeight + 20
                    radius: 6 // rounded corners for the card
                    color: Colors.md3.surface_container // bg color
                    border.width: 2
                    border.color: modelData.urgency === NotificationUrgency.Critical ? Colors.md3.error : Colors.md3.primary // border color depending on urgency

                    // arrange icon and text horizontally with RowLayout
                    RowLayout {
                        id: layout
                        anchors.fill: parent
                        anchors.margins: 10 // margins between the text and the box
                        spacing: 10

                        // format images
                        Image {
                            Layout.preferredHeight: 36
                            Layout.preferredWidth: 36
                            Layout.alignment: Qt.AlignTop
                            fillMode: Image.PreserveAspectFit
                            visible: source.toString() !== "" // hide image area of no image exists
                            source: card.modelData.image || card.modelData.appIcon || "" // where to grab the image from
                        }

                        // stack title and body, i.e. title: discord body: message sent to you
                        ColumnLayout {
                            Layout.fillWidth: true // use the entire space
                            spacing: 2

                            // title
                            Text {
                                Layout.fillWidth: true
                                text: card.modelData.summary // title (i.e. Discord)
                                color: Colors.md3.tertiary
                                elide: Text.ElideRight // cuts off the title if too long so it doesn't run off the card
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
                                text: card.modelData.body // body (i.e. screenshot copied to clipboard)
                                color: Colors.md3.tertiary
                                wrapMode: Text.WordWrap // allow multiple lines of text so it doesn't run off the card
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
