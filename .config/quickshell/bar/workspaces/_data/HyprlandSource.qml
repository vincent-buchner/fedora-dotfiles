pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Hyprland

// HyprlandWorkspace.toplevels proved unreliable as a data source on this
// Quickshell version (stale/empty even with real windows present). Shelling
// out to hyprctl directly, refreshed on Hyprland.rawEvent, is what actually
// works - the same approach used by end-4/dots-hyprland for the same reason.
Singleton {
    id: root

    property var clients: []
    property var workspaceIds: []
    property int activeWorkspaceId: -1

    // Allow-list of raw Hyprland events that can actually change the data
    // this singleton tracks (which workspaces exist, which clients live on
    // them, which workspace is active). Hyprland emits many other events far
    // more often than our data changes - activewindow/windowtitle fire on
    // every focus/title change, fullscreen and urgent don't touch workspace
    // membership at all - and refreshing on those would spawn 3 hyprctl
    // processes for no reason. Deliberately an allow-list rather than a
    // deny-list so adding a new noisy Hyprland event later can't silently
    // start triggering refreshes again.
    readonly property var relevantEvents: [
        "workspace", "workspacev2",
        "focusedmon", "focusedmonv2",
        "createworkspace", "createworkspacev2",
        "destroyworkspace", "destroyworkspacev2",
        "moveworkspace", "moveworkspacev2",
        "openwindow", "closewindow",
        "movewindow", "movewindowv2"
    ]

    function refresh() {
        getClients.running = true;
        getWorkspaces.running = true;
        getActiveWorkspace.running = true;
    }

    function clientsForWorkspace(id) {
        return root.clients.filter(c => c.workspace && c.workspace.id === id);
    }

    Component.onCompleted: root.refresh()

    Connections {
        target: Hyprland

        function onRawEvent(event) {
            if (root.relevantEvents.includes(event.name))
                root.refresh();
        }
    }

    Process {
        id: getClients
        command: ["hyprctl", "clients", "-j"]
        stdout: StdioCollector {
            id: clientsCollector
            onStreamFinished: root.clients = JSON.parse(clientsCollector.text)
        }
    }

    Process {
        id: getWorkspaces
        command: ["hyprctl", "workspaces", "-j"]
        stdout: StdioCollector {
            id: workspacesCollector
            onStreamFinished: {
                root.workspaceIds = JSON.parse(workspacesCollector.text)
                    .filter(w => w.id >= 1 && w.id <= 100)
                    .map(w => w.id);
            }
        }
    }

    Process {
        id: getActiveWorkspace
        command: ["hyprctl", "activeworkspace", "-j"]
        stdout: StdioCollector {
            id: activeCollector
            onStreamFinished: root.activeWorkspaceId = JSON.parse(activeCollector.text).id
        }
    }
}
