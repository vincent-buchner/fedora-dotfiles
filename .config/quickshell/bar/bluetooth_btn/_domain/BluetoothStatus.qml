pragma Singleton

import Quickshell
import QtQuick
import qs.bar.bluetooth_btn._data

Singleton {
    readonly property bool powered: BluetoothAdapterSource.adapter?.enabled ?? false
    readonly property bool connected: BluetoothAdapterSource.adapter?.devices.values.some(d => d.connected) ?? false

    readonly property string glyph: {
        if (!powered)
            return "󰂲"; // nf-md-bluetooth_off
        if (connected)
            return "󰂱"; // nf-md-bluetooth_connect
        return "󰂯"; // nf-md-bluetooth
    }
}
