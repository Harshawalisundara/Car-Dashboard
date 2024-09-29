import QtQuick 2.15
import QtQuick.Window 2.15
import Qt5Compat.GraphicalEffects

Window {
    width: 720
    height: 540
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

        Rectangle {
            width: parent.width * 0.65
            height: parent.height * 0.17
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 7
            color: "transparent"

            DropShadow {
                anchors.fill: parent
                source: trapezoidContainer
                color: "#01EBD4" // Shadow color
                radius: 20 // Softness of the shadow
                samples: 50 // Quality of the shadow blur
                spread: 0.05 // Spread of the shadow
                horizontalOffset: 0
                verticalOffset: 1 // Shadow offset below the canvas
            }

            Rectangle {
                id: trapezoidContainer
                width: parent.width
                height: parent.height
                color: "transparent"

                Canvas {
                    id: trapezoid
                    width: parent.width
                    height: parent.height

                    Row {
                        width: parent.width * 0.8
                        height: parent.height * 0.6
                        anchors.centerIn: parent
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
                                anchors.left: parent.left
                                anchors.leftMargin: 10
                                anchors.verticalCenter: parent.verticalCenter
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
                            color: "transparent"

                            Text {
                                id: date
                                text: qsTr("02/08/2022")
                                font.family: "Segoe UI Semibold"
                                font.pixelSize: parent.height * 0.5
                                anchors.centerIn: parent
                                color: "white"
                            }
                        }
                    }

                    onPaint: {
                        var ctx = getContext("2d")
                        var radius = 20

                        // Create a linear gradient from top to bottom
                        var gradient = ctx.createLinearGradient(0, 0, 0, height)
                        gradient.addColorStop(
                                    0, "#01EBD4") // Starting color at the top
                        gradient.addColorStop(
                                    0.7,
                                    "#212121") // Ending color at the bottom

                        ctx.fillStyle = gradient
                        ctx.beginPath()

                        // Define the inverted trapezoid shape with rounded bottom corners
                        ctx.moveTo(0, 0) // Top left
                        ctx.lineTo(width, 0) // Top right, wider at the top

                        // Top-right to bottom-right (with bottom-right rounded corner)
                        ctx.lineTo(width * 0.9,
                                   height - radius) // Line to the point before the corner
                        ctx.quadraticCurveTo(
                                    width * 0.9, height, width * 0.9 - radius,
                                    height) // Rounded bottom-right corner

                        // Bottom-right to bottom-left (with bottom-left rounded corner)
                        ctx.lineTo(width * 0.1 + radius,
                                   height) // Line to the point before the bottom-left corner
                        ctx.quadraticCurveTo(
                                    width * 0.1, height, width * 0.1,
                                    height - radius) // Rounded bottom-left corner

                        // Bottom-left back to top-left
                        ctx.lineTo(0, 0)

                        ctx.closePath()
                        ctx.fill()
                    }
                }
            }
        }

        Column {
            width: parent.width * 0.05
            height: parent.height * 0.4
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.leftMargin: 30

            Rectangle {
                width: parent.width
                height: parent.height / 4
                color: "transparent"
                anchors.left: parent.left
                anchors.leftMargin: 27

                Image {
                    id: parking
                    source: "qrc:/Image/Parking lights.png"
                    height: parent.height * 0.7
                    fillMode: Image.PreserveAspectFit
                    anchors.centerIn: parent
                }
            }
            Rectangle {
                width: parent.width
                height: parent.height / 4
                color: "transparent"
                anchors.left: parent.left
                anchors.leftMargin: 7

                Image {
                    id: auto
                    source: "qrc:/Image/Lights.png"
                    height: parent.height * 0.8
                    fillMode: Image.PreserveAspectFit
                    anchors.centerIn: parent
                }
            }
            Rectangle {
                width: parent.width
                height: parent.height / 4
                color: "transparent"
                // anchors.left: parent.left
                // anchors.leftMargin: 5
                Image {
                    id: low_beam_headlight
                    source: "qrc:/Image/Low beam headlights.png"
                    height: parent.height * 0.7
                    fillMode: Image.PreserveAspectFit
                    anchors.centerIn: parent
                }
            }
            Rectangle {
                width: parent.width
                height: parent.height / 4
                color: "transparent"

                Image {
                    id: foglight
                    source: "qrc:/Image/Rare fog lights.png"
                    height: parent.height * 0.7
                    fillMode: Image.PreserveAspectFit
                    anchors.centerIn: parent
                }
            }
        }
    }
}
