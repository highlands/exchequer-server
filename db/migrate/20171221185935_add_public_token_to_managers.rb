class AddPublicTokenToManagers < ActiveRecord::Migration[5.1]
  def change
    add_column :managers, :public_token, :string
  end
end
