#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include "rclcpp/rclcpp.hpp"
#include "std_msgs/msg/int64.hpp"

class BackEnd : public QObject
{
    Q_OBJECT
public:
    explicit BackEnd(QObject *parent = nullptr);
    ~BackEnd();

public slots:
    void setNumber(int number);

private:
    rclcpp::Node::SharedPtr node_;
    rclcpp::Publisher<std_msgs::msg::Int64>::SharedPtr publisher_;
    int count_;
};


#endif // BACKEND_H
