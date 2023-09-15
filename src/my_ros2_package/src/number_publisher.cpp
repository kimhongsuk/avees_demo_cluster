#include "rclcpp/rclcpp.hpp"
#include "std_msgs/msg/int64.hpp"

#include <memory>
using namespace std::chrono_literals;

class NumberPublisher : public rclcpp::Node
{
public:
    NumberPublisher()
    : Node("number_publisher"), count_(0)
    {
        publisher_ = this->create_publisher<std_msgs::msg::Int64>("number", 10);
        timer_ = this->create_wall_timer(
            1000ms, std::bind(&NumberPublisher::on_timer, this));
    }

private:
    void on_timer()
    {
        auto message = std_msgs::msg::Int64();
        message.data = count_++;
        RCLCPP_INFO(this->get_logger(), "Publishing: '%ld'", message.data);
        publisher_->publish(message);
    }
    rclcpp::TimerBase::SharedPtr timer_;
    rclcpp::Publisher<std_msgs::msg::Int64>::SharedPtr publisher_;
    int64_t count_;
};

int main(int argc, char * argv[])
{
    rclcpp::init(argc, argv);
    rclcpp::spin(std::make_shared<NumberPublisher>());
    rclcpp::shutdown();
    return 0;
}
