TorqueBox.configure do
  web do
    context '/'
  end

  ruby do
    version '1.9'
  end

  topic '/topics/test'

  job TestJob do
    # second minute hour dayOfMonth month dayOfWeek year(optional)
    cron '*/15 * * * * ?'
  end

  job DbJob do
    cron '*/5 * * * * ?'
  end

  stomp do
    host '192.168.1.138' # use the localhost for stomps
  end

  stomplet TestStomplet do
    route '/stomp/test'
  end
end
