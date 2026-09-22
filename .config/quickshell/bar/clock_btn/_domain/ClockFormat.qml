pragma Singleton

import Quickshell
import QtQuick
import qs.bar.clock_btn._data

Singleton {
    readonly property var monthNames: [
        "Jan", "Feb", "Mar", "Apr", "May", "Jun",
        "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"
    ]

    readonly property string display: {
        const date = SystemClockSource.now;
        const month = monthNames[date.getMonth()];
        const day = date.getDate();
        const time = Qt.formatDateTime(date, "hh:mm AP");
        return month + " " + day + ", " + time;
    }
}
