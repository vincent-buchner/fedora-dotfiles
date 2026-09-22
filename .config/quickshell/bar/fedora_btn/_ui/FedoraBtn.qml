import QtQuick
import qs.core.design_system
import qs.bar._ui

Rectangle {
    id: root
    implicitWidth: Metrics.barHeight
    implicitHeight: Metrics.barHeight
    radius: DesignTokens.radius.sm
    color: mouseArea.containsMouse ? Qt.rgba(1, 1, 1, 0.12) : "transparent"

    Text {
        anchors.centerIn: parent
        text: "" // nf-linux-fedora
        color: DesignTokens.colors.foreground
        font.pixelSize: Metrics.iconSize
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
    }
}
