// backend_receiver.cpp
#include "backend_receiver.h"

BackEndReceiver::BackEndReceiver(QObject *parent)
    : QObject(parent)
    , count_(0)
{
    rclcpp::init(0, nullptr);
    node_ = rclcpp::Node::make_shared("number_receiver");
    subscriber_ = node_->create_subscription<std_msgs::msg::Int64>("number", 10,
                    [this](const std_msgs::msg::Int64::SharedPtr msg) {
                        this->count_ = msg->data;
                        emit numberUpdated(this->count_);
                    });
}

BackEndReceiver::~BackEndReceiver()
{
    rclcpp::shutdown();
    if(spin_thread_.joinable()) {
        spin_thread_.join();
    }
}

void BackEndReceiver::startReceiving()
{
    spin_thread_ = std::thread([this]() {
        rclcpp::spin(node_);
    });
}
