pragma Singleton

import Quickshell
import QtQuick

Singleton {
    readonly property var pinned: [1, 2, 3, 4, 10]

    function shouldShow(id, clients, focused) {
        const isPinned = pinned.includes(id);
        const hasWindows = clients && clients.length > 0;

        return isPinned || focused === true || hasWindows;
    }
}
