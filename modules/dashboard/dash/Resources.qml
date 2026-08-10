import QtQuick
import Caelestia.Config
import qs.components
import qs.components.misc
import qs.services

Row {
    id: root

    anchors.top: parent.top
    anchors.bottom: parent.bottom

    padding: Tokens.padding.large
    spacing: Tokens.spacing.large

    Ref {
        service: SystemUsage
    }

    Resource {
        icon: "memory"
        value: SystemUsage.cpuPerc
        colour: Colours.palette.m3primary
    }

    Resource {
        icon: "memory_alt"
        value: SystemUsage.memPerc
        colour: Colours.palette.m3secondary
    }

    Resource {
        icon: "hard_disk"
        value: SystemUsage.storagePerc
        colour: Colours.palette.m3tertiary
    }

    component Resource: Item {
        id: res

        required property string icon
        required property real value
        required property color colour

        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.margins: Tokens.padding.normal
        implicitWidth: Math.max(42, progressBg.implicitWidth, percentLabel.implicitWidth, iconLabel.implicitWidth)

        StyledRect {
            id: progressBg

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.bottom: iconLabel.top
            anchors.bottomMargin: Tokens.spacing.small

            implicitWidth: Tokens.sizes.dashboard.resourceProgressThickness + 18

            color: Colours.layer(Colours.palette.m3surfaceContainerHigh, 2)
            radius: Tokens.rounding.full

            StyledRect {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                implicitHeight: res.value * parent.height

                color: res.colour
                radius: Tokens.rounding.full
            }
        }

        MaterialIcon {
            id: iconLabel

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: percentLabel.top
            anchors.bottomMargin: 4

            text: res.icon
            color: res.colour
            font.pointSize: Tokens.font.size.normal + 1
        }

        StyledText {
            id: percentLabel

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom

            text: Math.round(res.value * 100) + "%"
            color: Colours.palette.m3onSurfaceVariant
            font.pointSize: Tokens.font.size.normal
            font.weight: 600
        }

        Behavior on value {
            Anim {
                type: Anim.StandardLarge
            }
        }
    }
}
