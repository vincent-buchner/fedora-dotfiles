pragma Singleton

import Quickshell
import QtQuick
import qs.bar.workspaces._data

Singleton {
    function iconSource(workspaceItem) {
        if (!workspaceItem || !workspaceItem.clients || workspaceItem.clients.length === 0)
            return "";

        const appClass = workspaceItem.clients[0].class;
        if (!appClass)
            return "";

        const entry = DesktopEntrySource.lookup(appClass);
        if (!entry || !entry.icon)
            return "";

        return "image://icon/" + entry.icon;
    }
}
