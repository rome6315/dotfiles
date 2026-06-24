import Quickshell
import Quickshell.Io
import QtQuick

Item {
    id: root

    property int unstagedCount: 0 // count unstaged files
    property var files: [] // store unstaged file names
    property bool dirty: false

    // ignore color files and other irrelevant changes
    property var ignorePatterns: [/dunstrc/, /starship\.toml/, /kitty\/themes\/Matugen\.conf/, /kitty\/current-theme\.conf/, /waybar\/style\.css/, /waybar\/config/, /colors\.[a-z]+/, /\.uuid$/, /quickshell\/Matugen\/Colors.qml/]

    // helper for the timer
    function refresh() {
        unstagedCount = 0;
        files = [];
        proc.running = true;
    }

    // check every 5 min
    Timer {
        interval: 300000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: root.refresh()
    }

    Process {
        id: proc
        command: ["sh", "-c", "cd ~/dotfiles && git diff --name-only"] // this command is the heart of the process

        // store all files from the above command even if they're in the ignored list
        stdout: SplitParser {
            onRead: data => {
                let line = data.trim();
                if (line.length === 0)
                    return;

                root.files = root.files.concat([line]);
            }
        }

        // filter out the ignored files and put clean list into a new array called files
        onExited: code => {
            let filtered = [];

            for (let i = 0; i < root.files.length; i++) {
                let file = root.files[i];

                let ignored = false;

                for (let j = 0; j < root.ignorePatterns.length; j++) {
                    if (root.ignorePatterns[j].test(file)) {
                        ignored = true;
                        break;
                    }
                }

                if (!ignored)
                    filtered.push(file);
            }

            root.files = filtered; // set equal to the clean list of files
            root.unstagedCount = filtered.length; // get unstaged count
            root.dirty = filtered.length > 0; // if the list of files is > 0, dirty is true (used in the module to show 'Clean' if no updates)
        }
    }
}
