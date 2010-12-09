Rails.application.routes.draw do
  # Add your extension routes here
  match '/facebooker', :to => 'user_sessions#connect'
end
