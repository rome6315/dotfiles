// import Quickshell
// import Quickshell.Io
// import QtQuick

// // process to run the checkupdates command and get a count of available updates
// Item {
//     id: root

//     property int count: 0 // initialize updates count

//     // reset state and start process
//     function refresh() {
//         count = 0;
//         checkProc.running = true;
//     }

//     // run every 10 min and run on startup
//     Timer {
//         interval: 600000
//         running: true
//         repeat: true
//         triggeredOnStart: true
//         onTriggered: root.refresh()
//     }

//     // run the checkupdates command and count the number of updates
//     Process {
//         id: checkProc
//         command: ["checkupdates"]

//         stdout: SplitParser {
//             onRead: data => root.count++
//         }

//         // if no updates, set count to 0
//         onExited: code => {
//             if (code === 2)
//                 root.count = 0;
//         }
//     }
// }
import Quickshell
import Quickshell.Io
import QtQuick

Item {
    id: root

    property int count: 0
    property var updates: []

    function refresh() {
        count = 0;
        updates = [];
        checkProc.running = true;
    }

    Timer {
        interval: 600000 // 10 min
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: root.refresh()
    }

    Process {
        id: checkProc
        command: ["checkupdates"]

        stdout: SplitParser {
            onRead: data => {
                let line = data.trim();

                // "linux 6.8.1 -> 6.8.2"
                let pkg = line.split(" ")[0];

                root.updates = root.updates.concat([pkg]);
                root.count++;
            }
        }

        onExited: code => {
            if (code === 2) {
                root.count = 0;
                root.updates = [];
            }
        }
    }
}
