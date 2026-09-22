pragma Singleton

import Quickshell
import Quickshell.Bluetooth

Singleton {
    readonly property var adapter: Bluetooth.defaultAdapter
}
