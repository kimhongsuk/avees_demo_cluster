#include "backend.h"

BackEnd::BackEnd(QObject *parent)
    : QObject(parent)
    , count_(0)
{
    rclcpp::init(0, nullptr);
    node_ = rclcpp::Node::make_shared("number_publisher");
    publisher_ = node_->create_publisher<std_msgs::msg::Int64>("number", 10);
}

BackEnd::~BackEnd()
{
    rclcpp::shutdown();
}

void BackEnd::setNumber(int number)
{
    count_ = number;
    auto message = std_msgs::msg::Int64();
    message.data = count_;
    RCLCPP_INFO(node_->get_logger(), "Publishing: '%ld'", message.data);
    publisher_->publish(message);
}
