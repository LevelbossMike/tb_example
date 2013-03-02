class DbJob
  def run
    up_msg    = { title: "App is up! Time is: #{Time.now}" }
    last_post = Post.last

    last_post.nil? ? Post.create(up_msg) : last_post.update_attributes(up_msg)
  end
end
