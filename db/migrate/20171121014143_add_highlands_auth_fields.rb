# This migration comes from highlands_auth (originally 20151103030232)
class AddHighlandsAuthFields < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :household_id, :integer
    add_column :users, :token, :string
    add_column :users, :secret, :string
    add_column :users, :url, :string
    add_column :users, :type, :string
    add_column :users, :data, :json
    add_column :users, :slug, :string
  end
end
