class OauthAuthorization < ApplicationRecord
  belongs_to :user

  def self.from_omniauth(auth)
    user = User.find_by(email: auth[:info][:email])

    if user.present?
      provider = find_by(provider: auth[:provider], uid: auth[:uid], user: user)

      if provider.present?
        provider.user
      else
        OauthAuthorization.create(
          provider: auth[:provider],
          uid: auth[:uid],
          user: user
        )

        return user
      end
    else
      return OauthAuthorization.create_user_and_oauth_authorization(auth)
    end
  end

  def self.create_user_and_oauth_authorization(auth)
    user = User.create(email: auth[:info][:email],
                       password: Devise.friendly_token[0, 20])
    user.oauth_authorizations.create(
      provider: auth[:provider],
      uid: auth[:uid]
    )

    user
  end
end
