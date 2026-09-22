pragma Singleton

import Quickshell
import QtQuick

Singleton {
    readonly property QtObject radius: QtObject {
        readonly property int xs: 4
        readonly property int sm: 8
        readonly property int md: 12
        readonly property int lg: 16
        readonly property int xl: 24
    }

    readonly property QtObject colors: QtObject {
        readonly property color background: "#000000"
        readonly property color foreground: "#ffffff"
    }
}
