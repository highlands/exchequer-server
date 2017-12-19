HighlandsAuth::SessionsController.class_eval do
  private

  def redirect_user
    return redirect_to RedirectionManager.path_for(session[:from]) if session[:from]
    return redirect_to root_path
  end

  def after_update_user
    email = params[:user][:username]
    user = User.find_by(email: email)
    if user
      # Does something
    else
      User.create(email: email)
    end
  end
end
