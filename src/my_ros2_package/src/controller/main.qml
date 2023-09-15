import QtQuick 2.7
import QtQuick.Controls 2.2

ApplicationWindow {
    visible: true
    width: 640
    height: 480

    Slider {
        id: slider
        width: 200
        height: 50
        value: 0
        from: 0
        to: 100

        onValueChanged: {
            backend.setNumber(slider.value);
        }
    }
}
