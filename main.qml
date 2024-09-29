import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    color: "black"

    Rectangle {
        width: parent.width * 0.9
        height: parent.height * 0.6
        anchors.centerIn: parent
        color: "transparent"
        border.color: "#01EBD4"
        border.width: 7
        radius: 100

        Canvas {
            id: trapezoid
            width: parent.width * 0.65
            height: parent.height * 0.17
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 7

            Row {
                width: parent.width * 0.52
                height: parent.height * 0.6
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 0

                Rectangle {
                    width: parent.width / 3
                    height: parent.height
                    color: "transparent"

                    Image {
                        id: headlight
                        source: "qrc:/Image/Low beam headlights.png"
                        height: parent.height * 0.7
                        fillMode: Image.PreserveAspectFit
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    width: parent.width / 3
                    height: parent.height
                    color: "transparent"

                    Text {
                        id: time
                        text: qsTr("19:30")
                        font.family: "Segoe UI Semibold"
                        font.pixelSize: parent.height * 0.5
                        anchors.centerIn: parent
                        color: "white"
                    }
                }
                Rectangle {
                    width: parent.width / 3
                    height: parent.height
                    color: "blue"
                }
            }

            onPaint: {

                var ctx = getContext("2d")
                var radius = 20
                var gradient = ctx.createLinearGradient(0, 0, 0, height)
                gradient.addColorStop(0, "#01EBD4")
                gradient.addColorStop(1, "#212121")

                ctx.fillStyle = gradient
                ctx.beginPath()

                ctx.moveTo(0, 0)
                ctx.lineTo(width, 0)

                ctx.lineTo(width * 0.8, height - radius)
                ctx.quadraticCurveTo(width * 0.8, height,
                                     width * 0.8 - radius, height)

                ctx.lineTo(width * 0.2 + radius, height)
                ctx.quadraticCurveTo(width * 0.2, height, width * 0.2,
                                     height - radius)

                ctx.lineTo(0, 0)

                ctx.closePath()
                ctx.fill()
            }
        }
    }
}
