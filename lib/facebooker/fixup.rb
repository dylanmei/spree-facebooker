
Facebooker2::Rails::Helpers::FacebookConnect.module_eval do
  def fb_login_and_redirect(url, options = {})
    script = "FB.login(function(r) { if (r) window.location='#{url}'; })"
    text = options.delete(:text)

    content_tag("fb:login-button", text, options.merge(:onlogin => script))
  end
end
