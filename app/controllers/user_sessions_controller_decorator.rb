
UserSessionsController.class_eval do
  def connect
    user = User.find_by_facebook_id(current_facebook_user.id) if current_facebook_user
    if user
      create_user_session(user)
    else
      redirect_to :controller => :users, :action => :new
    end
  end
end