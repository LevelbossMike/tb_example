class TestJob
  include TorqueBox::Injectors

  def topic
    @topic ||= inject('/topics/test')
  end

  def run
    up_message = { message: "app is up", time: Time.now }
    topic.publish up_message.to_json
    puts "up message published"
  end
end
