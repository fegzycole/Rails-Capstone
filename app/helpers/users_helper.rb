module UsersHelper
  def logged_in?
    !current_user.nil?
  end

  attr_writer :current_user

  def current_user
    @current_user ||= User.find_by(remember_token: cookies[:remember_token])
  end

  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5.hexdigest(user.Username.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.Fullname, class: 'gravatar')
  end

  def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil
  end
end
