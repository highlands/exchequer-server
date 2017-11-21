HighlandsAuth::SessionsController.class_eval do
  private

  def after_update_user
    email = params[:user][:username]
    password = params[:user][:password]
    user = User.find_by(email: email)
    if user
      sign_in(:user, user)
    else
      User.create(email: email, password: password)
    end
  end
end
