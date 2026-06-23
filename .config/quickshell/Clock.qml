import Quickshell
import QtQuick
import qs.Matugen

Text {
    text: Qt.formatDateTime(clock.date, "hh:mm ap")
    color: Colors.md3.primary
    font {
        family: "Iosevka Nerd Font Bold"
        pixelSize: 15
        weight: 600
    }

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
}
