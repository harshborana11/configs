pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Hyprland

Singleton {
    id: root

    property int brightness: 0
    property int volume_speaker: 0
    property int volume_mic: 0

    property bool is_speaker_muted: false
    property bool is_mic_muted: false

    property list<string> brightness_icon_array: ["", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
    property list<string> volume_speaker_icon_array: ["󰕿", "󰖀", "󰕾"]
    property list<string> volume_mic_icon_array: ["󰍬"]

    property int brightness_icon_index: 0
    property int volume_speaker_icon_index: 0
    property int volume_mic_icon_index: 0

    property string brightness_icon: "NULL"
    property string volume_speaker_icon: "NULL"
    property string volume_mic_icon: "NULL"

    function update_brightness_icon() {
        let normalized = root.brightness / 100.0;
        root.brightness_icon_index = Math.round(normalized * (root.brightness_icon_array.length - 1));
        root.brightness_icon = root.brightness_icon_array[root.brightness_icon_index];
    }

    function update_volume_speaker_icon() {
        let normalized = root.volume_speaker / 100.0;
        root.volume_speaker_icon_index = Math.round(normalized * (root.volume_speaker_icon_array.length - 1));
        root.volume_speaker_icon = root.volume_speaker_icon_array[root.volume_speaker_icon_index];
    }

    function update_volume_mic_icon() {
        let normalized = root.volume_mic / 100.0;
        root.volume_mic_icon_index = Math.round(normalized * (root.volume_mic_icon_array.length - 1));
        root.volume_mic_icon = root.volume_mic_icon_array[root.volume_mic_icon_index];
    }

    Process {
        id: proc_brightness_get

        command: [Qt.resolvedUrl("../scripts/get_brightness.sh")]

        running: true

        stdout: StdioCollector {
            onStreamFinished: function () {
                root.brightness = Number(this.text);

                update_brightness_icon();
            }
        }
    }

    Timer {
        interval: 1000

        running: true

        repeat: true

        onTriggered: proc_brightness_get.running = true
    }

    function update_brightness() {
        proc_brightness_get.running = true;
    }

    Process {
        id: proc_volume_get_speaker

        command: [Qt.resolvedUrl("../scripts/get_volume.sh"), "speaker"]

        running: true

        stdout: StdioCollector {
            onStreamFinished: function () {
                root.volume_speaker = Number(this.text);

                update_volume_speaker_icon();
            }
        }
    }

    Timer {
        interval: 1000

        running: true

        repeat: true

        onTriggered: proc_volume_get_speaker.running = true
    }

    Process {
        id: proc_volume_get_mic

        command: [Qt.resolvedUrl("../scripts/get_volume.sh"), "mic"]

        running: true

        stdout: StdioCollector {
            onStreamFinished: function () {
                root.volume_mic = Number(this.text);
                update_volume_mic_icon();
            }
        }
    }

    Timer {
        interval: 1000

        running: true

        repeat: true

        onTriggered: proc_volume_get_mic.running = true
    }

    function update_volume() {
        proc_volume_get_speaker.running = true;
        proc_volume_get_mic.running = true;
    }

    Process {
        id: proc_brightness_set

        property int set_value: 0

        command: ["brightnessctl", "set", set_value + "%"]

        running: false

        onExited: function () {
            update_brightness();
        }
    }

    function set_brightness(brightness) {
        let value = Math.round(brightness);

        proc_brightness_set.set_value = value;
        proc_brightness_set.running = true;
    }

    Process {
        id: proc_volume_set_speaker

        property int set_value: 0

        command: ["pactl", "set-sink-volume", "@DEFAULT_SINK@", set_value + "%"]

        running: false

        onExited: function () {
            update_volume();
        }
    }

    function set_volume_speaker(volume) {
        let value = Math.round(volume);

        proc_volume_set_speaker.set_value = value;
        proc_volume_set_speaker.running = true;
    }

    Process {
        id: proc_volume_set_mic

        property int set_value: 0

        command: ["pactl", "set-source-volume", "@DEFAULT_SOURCE@", set_value + "%"]

        running: false

        onExited: function () {
            update_volume();
        }
    }

    function set_volume_mic(volume) {
        let value = Math.round(volume);

        proc_volume_set_mic.set_value = value;
        proc_volume_set_mic.running = true;
    }

    Process {
        id: proc_speaker_mute_get

        command: [Qt.resolvedUrl("../scripts/is_muted.sh"), "speaker"]

        running: true

        stdout: StdioCollector {
            onStreamFinished: function () {
                root.is_speaker_muted = (this.text.trim() == "YES");
            }
        }
    }

    Process {
        id: proc_mic_mute_get

        command: [Qt.resolvedUrl("../scripts/is_muted.sh"), "mic"]

        running: true

        stdout: StdioCollector {
            onStreamFinished: function () {
                root.is_mic_muted = (this.text.trim() == "YES");
            }
        }
    }

    Timer {
        interval: 1000

        running: true

        repeat: true

        onTriggered: function () {
            proc_speaker_mute_get.running = true;
            proc_mic_mute_get.running = true;
        }
    }

    Process {
        id: proc_speaker_mute_toggle

        command: [Qt.resolvedUrl("../scripts/toggle_mute.sh"), "speaker"]

        running: false

        onExited: function () {
            proc_speaker_mute_get.running = true;
        }
    }

    Process {
        id: proc_mic_mute_toggle

        command: [Qt.resolvedUrl("../scripts/toggle_mute.sh"), "mic"]

        running: false

        onExited: function () {
            proc_mic_mute_get.running = true;
        }
    }

    function toggle_speaker_mute() {
        proc_speaker_mute_toggle.running = true;
    }

    function toggle_mic_mute() {
        proc_mic_mute_toggle.running = true;
    }

    function update_workspaces() {
        workspaces = Hyprland.workspaces;
    }

    function update_window_manager() {
        update_workspaces();
        update_brightness();
        update_volume();
    }
}
