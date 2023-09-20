// backend_receiver.h
#ifndef BACKEND_RECEIVER_H
#define BACKEND_RECEIVER_H

#include <QObject>
#include "rclcpp/rclcpp.hpp"
#include "std_msgs/msg/int64.hpp"
#include <thread>
#include "ocr2lrc.hpp"
class BackEndReceiver : public QObject
{
    Q_OBJECT
public:
    explicit BackEndReceiver(QObject *parent = nullptr);
    ~BackEndReceiver();

private:
    rclcpp::Node::SharedPtr node_;
    rclcpp::Subscription<ros2_msg::msg::Ocr2lrc>::SharedPtr subscriber_;
    int count_;
    std::thread spin_thread_;

public slots:
    void startReceiving();

signals:
    void numberUpdated(int number);
};

#endif // BACKEND_RECEIVER_H
