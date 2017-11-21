class DropOauthAuthorizations < ActiveRecord::Migration[5.1]
  def change
    drop_table :oauth_authorizations do |t|
      t.string :provider
      t.string :uid
    end
  end
end
