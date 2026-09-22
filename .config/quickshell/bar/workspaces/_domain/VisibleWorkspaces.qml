pragma Singleton

import Quickshell
import QtQuick
import qs.bar.workspaces._data

Singleton {
    // Builds the ordered list of workspaces the bar should render this frame.
    // A workspace appears if it's pinned, currently focused, or has open windows -
    // plus a placeholder for any pinned workspace Hyprland hasn't created yet
    // (Hyprland only reports a workspace once something puts a window on it).
    //
    // Example:
    //   HyprlandSource.workspaceIds      = [2, 5, 9]   (workspaces Hyprland currently knows about)
    //   HyprlandSource.activeWorkspaceId = 5
    //   clientsForWorkspace(2) = [],  clientsForWorkspace(5) = [oneClient],  clientsForWorkspace(9) = []
    //   WorkspaceVisibility.pinned = [1, 2, 3, 4, 9]
    //
    //   computeList() ->
    //     [ {id:1, focused:false, clients:[]},          // pinned, not a real workspace yet -> placeholder
    //       {id:2, focused:false, clients:[]},          // pinned, empty, real workspace
    //       {id:3, focused:false, clients:[]},          // pinned placeholder
    //       {id:4, focused:false, clients:[]},          // pinned placeholder
    //       {id:5, focused:true,  clients:[oneClient]}, // focused, shown even though not pinned
    //       {id:9, focused:false, clients:[]} ]         // pinned, empty, real workspace
    //   (workspaces 6, 7, 8, 10... are never in the result: not pinned, not focused, no windows)
    function computeList() {
        const seen = {};
        const result = [];

        // Pass 1: walk every workspace Hyprland currently reports existing, and
        // keep the ones that pass the visibility rule (pinned / focused / has windows).
        for (const id of HyprlandSource.workspaceIds) {
            seen[id] = true;
            const clients = HyprlandSource.clientsForWorkspace(id);
            const focused = id === HyprlandSource.activeWorkspaceId;

            if (WorkspaceVisibility.shouldShow(id, clients, focused))
                result.push({ id: id, focused: focused, clients: clients });
        }

        // Pass 2: pinned workspaces don't exist in Hyprland until something is
        // placed on them, so add a placeholder for any pinned id pass 1 didn't see.
        for (const id of WorkspaceVisibility.pinned) {
            if (!seen[id])
                result.push({ id: id, focused: false, clients: [] });
        }

        // Pass 1 and pass 2 append in different orders (Hyprland's order, then
        // pinned's order), so sort by id to get a stable left-to-right layout.
        result.sort((a, b) => a.id - b.id);
        return result;
    }
}
