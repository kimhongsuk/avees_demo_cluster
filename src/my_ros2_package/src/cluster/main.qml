import QtQuick 2.7
import QtQuick.Controls 2.2
import "."
import QtMultimedia 5.5

ApplicationWindow {
    visible: true
    width: screen.width
    height: screen.height
    title: qsTr("Speedometer")

    // Background Image
    Image {
        id: backgroundImage
        anchors.fill: parent
        source: "image/back.png" // Replace with the path to your background image
    }
    // speed gage
    Image {
        id: speedImage
        width: 590
        height: 590
        anchors.verticalCenterOffset: -175
        anchors.horizontalCenterOffset: -548
        anchors.centerIn: parent
        source: "image/dial.png" // Replace with the path to your arc image
    }
    Image {
        id: rpmImage
        width: 550
        height: 550
        anchors.verticalCenterOffset: -185
        anchors.horizontalCenterOffset: 527
        anchors.centerIn: parent
        source: "image/rpm.png" // Replace with the path to your arc image
    }
    // Car Image
    Image {
        id: carImage
        y: -484
        width: 412 // Adjust the width of the car image
        height: 299
        anchors.horizontalCenterOffset: 0
        anchors.bottomMargin: 185 // Adjust the height of the car image
        source: "image/car1.png" // Replace with the path to your car image
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            margins: 20
        }
    }
    Image {
        id: gearImage
        width: 450
        height: 450
        scale: 1
        anchors.verticalCenterOffset: -334
        anchors.horizontalCenterOffset: 1
        anchors.centerIn: parent
        source: "image/volk.png"
    }

    Row {
        anchors.verticalCenterOffset: 486
        anchors.horizontalCenterOffset: 0
        anchors.centerIn: parent
        spacing: 10

        Text {
            id: pText
            font.pixelSize: 130
            font.italic: true
            font.bold: true
            text: "P"
            color: 'red'
        }

        Text {
            id: rText
            font.pixelSize: 130
            font.italic: true
            font.bold: true
            text: "R"
            color: 'white'
        }

        Text {
            id: nText
            font.pixelSize: 130
            font.italic: true
            font.bold: true
            text: "N"
            color: 'white'
        }

        Text {
            id: dText
            font.pixelSize: 130
            font.italic: true
            font.bold: true
            text: "D"
            color: 'white'
        }

    }
    Canvas {
        id: canvas
        width: 200
        height: 200
        anchors.verticalCenterOffset: -175
        anchors.horizontalCenterOffset: -548
        anchors.centerIn: parent
        rotation: 180

        property real rotationAngle: 0

        Connections {
            target: backendReceiver
            onNumberUpdated: {
                canvas.rotationAngle = (number / 100) * 360;
                canvas.requestPaint();
            }
        }

        onPaint: {
            var ctx = getContext('2d');
            var centerX = width / 2;
            var centerY = height / 2;

            // Clear the canvas
            ctx.clearRect(0, 0, width, height);

            // Draw the speed bar
            var angle = ((rotationAngle * 0.74) -40) * Math.PI / 180; // Convert rpm to angle
            ctx.beginPath();
            ctx.moveTo(centerX, centerY);
            ctx.lineTo(centerX + 135 * Math.cos(angle), centerY + 135 * Math.sin(angle));
            ctx.lineWidth = 7;
            ctx.strokeStyle = '#ff0000';
            ctx.stroke();
        }

    }
    Canvas {
        id: rpmpointer
        width: parent.width
        height: parent.height
        anchors.verticalCenterOffset: -185
        anchors.horizontalCenterOffset: 527
        rotation: 180
        anchors.centerIn: parent
        onPaint: {
            var ctx = getContext('2d');
            var centerX = width / 2;
            var centerY = height / 2;

            // Clear the canvas
            ctx.clearRect(0, 0, width, height);

            // Draw the speed bar
            var angle = (-45) * Math.PI / 180; // Convert rpm to angle
            ctx.beginPath();
            ctx.moveTo(centerX, centerY);
            ctx.lineTo(centerX + 135 * Math.cos(angle), centerY + 135 * Math.sin(angle));
            ctx.lineWidth = 7;
            ctx.strokeStyle = '#ff0000';
            ctx.stroke();
        }

    }
    Component.onCompleted: {
        backendReceiver.startReceiving();
    }
}
