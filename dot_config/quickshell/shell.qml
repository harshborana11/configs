//@ pragma UseQApplication
import "./Bar"
import QtQuick
import Quickshell
import Quickshell.Io

Scope {
    id: root
    Variants {
        model: Quickshell.screens

        Bar {}
    }
}
