class Hooks < Spree::ThemeSupport::HookListener
  # custom hooks go here

  insert_after :inside_head do
    %[
      <%= stylesheet_link_tag 'facebooker.css' %>
      <%= javascript_include_tag 'facebooker.js' %>
    ]
  end
end