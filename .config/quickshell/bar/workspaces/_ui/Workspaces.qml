import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import qs.core.design_system
import qs.bar._ui
import qs.bar.workspaces._data
import qs.bar.workspaces._domain

RowLayout {
    id: root
    spacing: 2

    property var workspaceList: VisibleWorkspaces.computeList()

    // Reassigning through null first guarantees Repeater sees a real change
    // and fully rebuilds its delegates - QML can otherwise suppress a list
    // property's own change signal when the new array looks equal to the
    // old one by content, even though the underlying workspace data changed.
    function refresh() {
        root.workspaceList = null;
        root.workspaceList = VisibleWorkspaces.computeList();
    }

    // HyprlandSource.refresh() runs 3 hyprctl calls in parallel, so a single
    // Hyprland event can fire clientsChanged/workspaceIdsChanged/
    // activeWorkspaceIdChanged separately as each one finishes. Routing all
    // three through this timer instead of calling refresh() directly collapses
    // them into a single rebuild once they've all landed for this tick.
    Timer {
        id: refreshDebounce
        interval: 0
        onTriggered: root.refresh()
    }

    Connections {
        target: HyprlandSource
        function onClientsChanged() {
            refreshDebounce.restart();
        }
        function onWorkspaceIdsChanged() {
            refreshDebounce.restart();
        }
        function onActiveWorkspaceIdChanged() {
            refreshDebounce.restart();
        }
    }

    Repeater {
        model: root.workspaceList

        delegate: Rectangle {
            id: delegate
            required property var modelData

            readonly property string iconSource: WorkspaceIcon.iconSource(modelData)

            implicitWidth: Metrics.barHeight
            implicitHeight: Metrics.barHeight
            radius: DesignTokens.radius.sm
            color: mouseArea.containsMouse ? Qt.rgba(1, 1, 1, 0.12) : "transparent"

            IconImage {
                anchors.centerIn: parent
                visible: delegate.iconSource !== ""
                source: delegate.iconSource
                implicitSize: Metrics.iconSize
                opacity: modelData.focused ? 1.0 : 0.5
            }

            Text {
                anchors.centerIn: parent
                visible: delegate.iconSource === ""
                text: modelData.id
                color: modelData.focused ? DesignTokens.colors.foreground : Qt.rgba(1, 1, 1, 0.5)
                font.pixelSize: 13
            }

            MouseArea {
                id: mouseArea
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: WorkspaceActions.switchTo(modelData.id)
            }
        }
    }
}
