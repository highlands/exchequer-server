class RemovePasswordFields < ActiveRecord::Migration[5.1]
  def change
    reversible do |dir|
      change_table :users do |t|
        dir.down do
          t.column :encrypted_password, :string
          t.column :reset_password_token, :string
          t.column :reset_password_sent_at, :string
        end
      end
    end
  end
end
