
Facebooker2.module_eval do
  class << self
    attr_accessor :permissions
  end

  def self.configuration=(hash)
    self.api_key = hash[:api_key]
    self.secret = hash[:secret]
    self.app_id = hash[:app_id]
    self.permissions = hash[:permissions] || ''
  end
end

Facebooker2::Rails::Helpers::FacebookConnect.module_eval do
  def fb_login_and_connect(options = {})
    fb_login_and_redirect(
      url_for(:controller => 'user_sessions', :action => 'connect'),
      options
    )
  end

  def fb_login_and_redirect(url, options = {})
    text = options.delete(:text)
    options.merge!(:onlogin =>"facebooker.login('#{url}');")
    options.merge!(:perms => Facebooker2.permissions) unless options.has_key?(:perms)

    content_tag("fb:login-button", text, options)
  end

  def fb_logout_link(text, url, *args)
    function = "facebooker.logout('#{url}');"
    link_to_function text, function, *args
  end
end
