import QtQuick
import qs.core.design_system
import qs.bar._ui
import qs.bar.clock_btn._domain

Rectangle {
    id: root
    implicitWidth: label.implicitWidth + Metrics.itemSpacing * 2
    implicitHeight: Metrics.barHeight
    radius: DesignTokens.radius.sm
    color: mouseArea.containsMouse ? Qt.rgba(1, 1, 1, 0.12) : "transparent"

    Text {
        id: label
        anchors.centerIn: parent
        text: ClockFormat.display
        color: DesignTokens.colors.foreground
        font.pixelSize: Metrics.iconSize
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
    }
}
