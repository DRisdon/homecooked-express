class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :email
      t.string :avatar
      t.string :auth_token

      t.timestamps
    end
    add_index :users, :auth_token, unique: true
  end
end
