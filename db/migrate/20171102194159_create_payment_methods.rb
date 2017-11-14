class CreatePaymentMethods < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_methods do |t|
      t.references :user, foreign_key: true
      t.string :token

      t.timestamps
    end
  end
end
