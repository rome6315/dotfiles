import Quickshell
import Quickshell.Io
import QtQuick

// process to check if any files from my git repo need to be pushed to github
Item {
    id: root

    // initialize variables
    property int unstagedCount: 0
    property bool dirty: false
    property var files: []

    // set ignore list since these files aren't important when using Matugen
    property var ignorePatterns: [/dunstrc/, /starship\.toml/, /kitty\/themes\/Matugen\.conf/, /kitty\/current-theme\.conf/, /waybar\/style\.css/, /waybar\/config/, /colors\.[a-z]+/, /\.uuid$/, /quickshell\/Matugen\/Colors.qml/]

    // function for refreshing after the interval
    function refresh() {
        unstagedCount = 0;
        files = [];
        proc.running = true;
    }

    // run every 5 min and on startup
    Timer {
        interval: 300000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: root.refresh()
    }

    Process {
        id: proc
        command: ["sh", "-c", "cd ~/dotfiles && git diff --name-only"] // get the list of unstaged files

        // load each unstaged file into the files array
        stdout: SplitParser {
            onRead: data => {
                let line = data.trim();
                if (line.length > 0)
                    root.files.push(line);
            }
        }

        onExited: code => {
            let count = 0; // unstaged files that aren't on ignore list

            // loop through each file
            for (let i = 0; i < root.files.length; i++) {
                let file = root.files[i];

                let ignored = false; // initialize ignored var

                // if the file is ignored, break
                for (let j = 0; j < root.ignorePatterns.length; j++) {
                    if (root.ignorePatterns[j].test(file)) {
                        ignored = true;
                        break;
                    }
                }

                // count non-ignored files
                if (!ignored)
                    count++;
            }

            root.unstagedCount = count; // save count
            root.dirty = count > 0; // if count is > 0, true, else false since dirty is a bool

            root.files = []; // clear old results so next refresh starts fresh
        }
    }
}
