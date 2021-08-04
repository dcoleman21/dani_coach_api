class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :cell_phone
      t.string :signature
      t.string :internal_email
      t.string :password_digest
      t.string :token

      t.timestamps
    end
  end
end
