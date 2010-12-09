
UsersController.class_eval do
  new_action.before do
    facebooker = current_facebook_user.fetch if current_facebook_user
    @user.email = facebooker.email if facebooker
  end

  create.before do
    facebooker = current_facebook_user.fetch if current_facebook_user
    if (facebooker)
      @user.facebook_id = facebooker.id
      @user.facebook_link = facebooker.link
    end
  end

  create.after do
    create_session
    associate_user
  end

  def associate_user
    return unless current_order and @user.valid?
    current_order.associate_user!(@user)
    session[:guest_token] = nil
  end

  def create_session
    if (current_facebook_user)
      user = User.find_by_facebook_id(current_facebook_user.id)
      UserSession.create(user) if user
    else
      session_params = params[:user]
      session_params[:login] = session_params[:email]
      UserSession.create session_params
    end
  end  
end