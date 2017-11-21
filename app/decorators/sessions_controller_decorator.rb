HighlandsAuth::SessionsController.class_eval do
  private

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
