
Facebooker2::Rails::Helpers::FacebookConnect.module_eval do
  def fb_login_and_redirect(url, options = {})
    text = options.delete(:text)
    script = "facebooker.login('#{url}');"

    content_tag("fb:login-button", text, options.merge(:onlogin => script))
  end

  def fb_logout_link(text, url, *args)
    function = "facebooker.logout('#{url}');"
    link_to_function text, function, *args
  end
end
