QT += quick

CONFIG += c++14

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        backend_receiver.cpp \
        main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

INCLUDEPATH += /opt/ros/foxy/include
INCLUDEPATH += /home/avees/ros2_ws/install/ros2_msg/include/ros2_msg/msg
INCLUDEPATH += /home/avees/ros2_ws/install/ros2_msg/include
LIBS += -L/opt/ros/foxy/lib -lrclcpp -lrcl -lrcutils -lstd_msgs__rosidl_typesupport_cpp -llibstatistics_collector -lstatistics_msgs__rosidl_typesupport_cpp -ltracetools
LIBS += -L/home/avees/ros2_ws/install/ros2_msg/lib -lros2_msg__rosidl_typesupport_introspection_cpp -lros2_msg__rosidl_typesupport_introspection_c -lros2_msg__rosidl_typesupport_fastrtps_cpp -lros2_msg__rosidl_typesupport_fastrtps_c -lros2_msg__rosidl_typesupport_cpp -lros2_msg__rosidl_typesupport_c -lros2_msg__rosidl_generator_c -lros2_msg__python
HEADERS += \
    backend_receiver.h

DISTFILES += \
    image/back.png \
    image/car1.png \
    image/dial.png \
    image/rpm.png \
    image/star.png \
    image/volk.png \
    image/warning.png

