class CallbacksController < Devise::OmniauthCallbacksController
  def github
    oauth_callback
  end

  def oauth_callback
    @user = OauthAuthorization.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in(:user, @user)

      redirect_to(add_payment_path) && return unless @user.payment_methods?

      redirect_to RedirectionManager.path_for(session[:from])
    else
      flash[:error] = @user.errors.full_messages
      redirect_to new_user_session_path
    end
  end
end
