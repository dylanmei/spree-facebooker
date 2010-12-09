class Hooks < Spree::ThemeSupport::HookListener
  # custom hooks go here

  insert_after :inside_head do
    %[
      <%= javascript_include_tag 'facebooker.js' %>
    ]
  end
end