import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.core.design_system
import qs.bar.fedora_btn._ui
import qs.bar.workspaces._ui
import qs.bar.clock_btn._ui
import qs.bar.github_btn._ui
import qs.bar.wifi_btn._ui
import qs.bar.volume_btn._ui
import qs.bar.bluetooth_btn._ui
import qs.bar.battery_btn._ui

Scope {
    id: root

    Variants {
        model: Quickshell.screens

        delegate: PanelWindow {
            required property var modelData
            screen: modelData
            color: "transparent"

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: Metrics.barHeight + Metrics.edgeMargin

            Rectangle {
                anchors {
                    left: parent.left
                    right: parent.right
                    top: parent.top
                    leftMargin: Metrics.edgeMargin
                    rightMargin: Metrics.edgeMargin
                    topMargin: Metrics.edgeMargin
                }
                height: Metrics.barHeight
                radius: DesignTokens.radius.md
                color: Qt.rgba(
                    DesignTokens.colors.background.r,
                    DesignTokens.colors.background.g,
                    DesignTokens.colors.background.b,
                    0.3
                )

                RowLayout {
                    anchors {
                        left: parent.left
                        verticalCenter: parent.verticalCenter
                        leftMargin: Metrics.itemSpacing
                    }
                    spacing: Metrics.sectionGap

                    FedoraBtn {}
                    Workspaces {}
                }

                ClockBtn {
                    anchors.centerIn: parent
                }

                RowLayout {
                    anchors {
                        right: parent.right
                        verticalCenter: parent.verticalCenter
                        rightMargin: Metrics.itemSpacing
                    }
                    spacing: Metrics.itemSpacing

                    GithubBtn {}
                    WifiBtn {}
                    VolumeBtn {}
                    BluetoothBtn {}
                    BatteryBtn {}
                }
            }
        }
    }
}
