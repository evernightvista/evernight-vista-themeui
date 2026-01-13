import QtQuick
import QtQuick.Effects
import org.kde.kirigami 2.0 as Kirigami

Image {
    id: root

    property int stage

    source: "images/background.png"
    onStageChanged: {
        if (stage == 2) {
            introAnimation.running = true;
        } else if (stage == 5) {
            introAnimation.target = busyIndicator;
            introAnimation.from = 1;
            introAnimation.to = 0;
            introAnimation.running = true;
        }
    }

    Item {
        id: content

        anchors.fill: parent
        opacity: 0

        Image {
            id: logo

            readonly property real size: Kirigami.Units.gridUnit * 4

            anchors.centerIn: parent
            asynchronous: true
            source: "images/evernight.svg"
            sourceSize.height: size
        }

        MultiEffect {
            source: logo
            anchors.fill: logo
            shadowBlur: 1
            shadowEnabled: true
            shadowColor: "black"
            shadowVerticalOffset: 2
            shadowHorizontalOffset: 2
        }

        Image {
            id: busyIndicator

            //in the middle of the remaining space
            y: parent.height - (parent.height - logo.y) / 2 - height / 2
            anchors.horizontalCenter: parent.horizontalCenter
            asynchronous: true
            source: "images/busy.svgz"
            sourceSize.height: Kirigami.Units.gridUnit * 2
            sourceSize.width: Kirigami.Units.gridUnit * 2

            MultiEffect {
                source: busyIndicator
                anchors.fill: busyIndicator
                shadowBlur: 1
                shadowEnabled: true
                shadowColor: "black"
                shadowVerticalOffset: 0
                shadowHorizontalOffset: 0
            }

            RotationAnimator on rotation {
                id: rotationAnimator

                from: 0
                to: 360
                // Not using a standard duration value because we don't want the
                // animation to spin faster or slower based on the user's animation
                // scaling preferences; it doesn't make sense in this context
                duration: 2000
                loops: Animation.Infinite
                // Don't want it to animate at all if the user has disabled animations
                running: Kirigami.Units.longDuration > 1
            }

        }

        Row {
            spacing: Kirigami.Units.largeSpacing

            anchors {
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
                margins: Kirigami.Units.gridUnit
            }

            Image {
                asynchronous: true
                source: "images/powered.svgz"
                sourceSize.height: Kirigami.Units.gridUnit * 2
                sourceSize.width: Kirigami.Units.gridUnit * 2
            }

            Column {
                spacing: Kirigami.Units.smallSpacing
                anchors.verticalCenter: parent.verticalCenter

                Text {
                    color: "#000000"
                    text: "Powered by"
                }

                Text {
                    color: "#EB9535"
                    text: "Evernight Vista"
                    font.bold: true
                    font.pixelSize: Kirigami.Units.fontMetrics.font.pixelSize * 1.3
                }
            }
        }
    }

    OpacityAnimator {
        id: introAnimation

        running: false
        target: content
        from: 0
        to: 1
        duration: Kirigami.Units.veryLongDuration * 2
        easing.type: Easing.InOutQuad
    }

}
