import QtQuick 2.15
import QtQuick.Window 2.15
import Qt5Compat.GraphicalEffects

Window {
    width: 720
    height: 540
    visible: true
    title: qsTr("Hello World")
    color: "black"

    property bool isWhiteImageHeadlight: true
    property bool isWhiteImageAuto: true
    property bool isWhiteImageFog: true
    property bool isWhiteImageParking: true
    property bool isWhiteImageAbs: true
    property bool isWhiteImagePark: true
    property bool isWhiteImageHeadbrake: true
    property bool isWhiteImageBelt: true

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
                color: "#01EBD4"
                radius: 20
                samples: 50
                spread: 0.05
                horizontalOffset: 0
                verticalOffset: 1
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

                        var gradient = ctx.createLinearGradient(0, 0, 0, height)
                        gradient.addColorStop(0, "#01EBD4")
                        gradient.addColorStop(0.7, "#212121")

                        ctx.fillStyle = gradient
                        ctx.beginPath()

                        ctx.moveTo(0, 0)
                        ctx.lineTo(width, 0)
                        ctx.lineTo(width * 0.9, height - radius)
                        ctx.quadraticCurveTo(width * 0.9, height,
                                             width * 0.9 - radius, height)
                        ctx.lineTo(width * 0.1 + radius, height)
                        ctx.quadraticCurveTo(width * 0.1, height, width * 0.1,
                                             height - radius)

                        ctx.lineTo(0, 0)

                        ctx.closePath()
                        ctx.fill()
                    }
                }
            }
        }

        Column {
            id: left_light_btn
            width: parent.width * 0.05
            height: parent.height * 0.4
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 35
            anchors.leftMargin: 30

            Rectangle {
                width: parent.width
                height: parent.height / 4
                color: "transparent"
                anchors.left: parent.left
                anchors.leftMargin: 27

                Image {
                    id: parking
                    source: isWhiteImageParking ? "qrc:/Image/Parking lights_white.png" : "qrc:/Image/Parking lights.png"
                    height: parent.height * 0.7
                    fillMode: Image.PreserveAspectFit
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        isWhiteImageParking = !isWhiteImageParking
                    }
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
                    source: isWhiteImageAuto ? "qrc:/Image/Lights_white.png" : "qrc:/Image/Lights.png"
                    height: parent.height * 0.8
                    fillMode: Image.PreserveAspectFit
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        isWhiteImageAuto = !isWhiteImageAuto
                    }
                }
            }

            Rectangle {
                width: parent.width
                height: parent.height / 4
                color: "transparent"

                Image {
                    id: low_beam_headlight
                    source: isWhiteImageHeadlight ? "qrc:/Image/Low beam headlights_white.png" : "qrc:/Image/Low beam headlights.png"
                    height: parent.height * 0.7
                    fillMode: Image.PreserveAspectFit
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        isWhiteImageHeadlight = !isWhiteImageHeadlight
                    }
                }
            }

            Rectangle {
                width: parent.width
                height: parent.height / 4
                color: "transparent"

                Image {
                    id: foglight
                    source: isWhiteImageFog ? "qrc:/Image/Rare fog lights_white.png" : "qrc:/Image/Rare fog lights.png"
                    height: parent.height * 0.7
                    fillMode: Image.PreserveAspectFit
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        isWhiteImageFog = !isWhiteImageFog
                    }
                }
            }
        }

        Column {
            id: right_light_btn
            width: parent.width * 0.05
            height: parent.height * 0.4
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 35
            anchors.rightMargin: 30

            Rectangle {
                width: parent.width
                height: parent.height / 4
                color: "transparent"
                anchors.left: parent.left
                anchors.leftMargin: -27

                Image {
                    id: abs
                    source: isWhiteImageAbs ? "qrc:/Image/ABS_white.png" : "qrc:/Image/ABS.png"
                    height: parent.height * 0.7
                    fillMode: Image.PreserveAspectFit
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        isWhiteImageAbs = !isWhiteImageAbs
                    }
                }
            }

            Rectangle {
                width: parent.width
                height: parent.height / 4
                color: "transparent"
                anchors.left: parent.left
                anchors.leftMargin: -7

                Image {
                    id: park
                    source: isWhiteImagePark ? "qrc:/Image/Park_white.png" : "qrc:/Image/Park.png"
                    height: parent.height * 0.7
                    fillMode: Image.PreserveAspectFit
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        isWhiteImagePark = !isWhiteImagePark
                    }
                }
            }

            Rectangle {
                width: parent.width
                height: parent.height / 4
                color: "transparent"

                Image {
                    id: brake
                    source: isWhiteImageHeadbrake ? "qrc:/Image/Brake_white.png" : "qrc:/Image/Brake.png"
                    height: parent.height * 0.7
                    fillMode: Image.PreserveAspectFit
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        isWhiteImageHeadbrake = !isWhiteImageHeadbrake
                    }
                }
            }

            Rectangle {
                width: parent.width
                height: parent.height / 4
                color: "transparent"

                Image {
                    id: sheetbelt
                    source: isWhiteImageBelt ? "qrc:/Image/belt.png" : "qrc:/Image/belt_green.png"
                    height: parent.height * 0.6
                    fillMode: Image.PreserveAspectFit
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        isWhiteImageBelt = !isWhiteImageBelt
                    }
                }
            }
        }

        Rectangle {
            width: parent.width * 0.75
            height: parent.height * 0.65
            color: "transparent"
            border.color: "blue"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom

            Rectangle {
                id: batteryIndicator
                width: 150
                height: 150
                color: "transparent"

                Rectangle {
                    width: parent.width * 0.6
                    height: parent.height * 0.35
                    color: "transparent"
                    anchors.centerIn: parent

                    Text {
                        id: batteryPercentageText
                        text: "87%" // Use \n for line break
                        font.pixelSize: 30
                        color: "white"
                        anchors.horizontalCenter: parent.horizontalCenter // Align the text horizontally
                    }
                    Text {
                        id: batteryText
                        text: "Battery charge" // Use \n for line break
                        font.pixelSize: 10
                        color: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: parent.bottom
                    }
                }

                // Battery arc
                Canvas {
                    id: batteryCanvas // Give the Canvas an id
                    anchors.fill: parent
                    onPaint: {
                        var ctx = batteryCanvas.getContext(
                                    "2d") // Use the id to get the context
                        ctx.clearRect(0, 0, batteryCanvas.width,
                                      batteryCanvas.height)

                        // Battery arc parameters
                        var centerX = batteryCanvas.width / 2
                        var centerY = batteryCanvas.height / 2
                        var radius = Math.min(batteryCanvas.width,
                                              batteryCanvas.height) / 2 - 10
                        var startAngle = Math.PI / 30 // Starting angle at the top

                        // Calculate end angle based on battery percentage
                        var endAngle = startAngle + (batteryPercentageText.text.replace(
                                                         "%",
                                                         "") * 2 * Math.PI) / 100

                        // Create a gradient
                        var gradient = ctx.createLinearGradient(
                                    0, 0, batteryCanvas.width,
                                    batteryCanvas.height)
                        gradient.addColorStop(0, "#01E4E0") // Start color
                        gradient.addColorStop(1, "#01E4E0") // End color

                        // Draw the battery arc
                        ctx.beginPath()
                        ctx.arc(centerX, centerY, radius, startAngle, endAngle)
                        ctx.lineWidth = 7
                        ctx.strokeStyle = gradient // Apply gradient
                        ctx.stroke()
                    }
                }
            }

            Rectangle {
                width: parent.width * 0.2
                height: 80
                color: "transparent"
                anchors.horizontalCenter: parent.horizontalCenter

                Text {
                    id: speed
                    text: qsTr("68")
                    font.family: "Tw Cen MT Condensed Extra Bold"
                    styleColor: "#1cc497"
                    style: Text.Sunken
                    color: "#01E6DE"
                    font.pixelSize: 55
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Text {
                    id: speed_txt
                    text: qsTr("MPH")
                    font.family: "Segoe UI"
                    styleColor: "#1cc497"
                    style: Text.Sunken
                    color: "#01E6DE"
                    font.pixelSize: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                }
            }
        }
    }
}
