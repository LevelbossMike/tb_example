require 'torquebox-stomp'

class TestStomplet < TorqueBox::Stomp::JmsStomplet
  def on_subscribe(subscriber)
    topic = destination_for('/topics/test', :topic)
    subscribe_to(subscriber, topic)
  end
end
