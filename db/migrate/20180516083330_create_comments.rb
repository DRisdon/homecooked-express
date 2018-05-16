class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.bigint :user_id
      t.bigint :dinner_id
      t.text :content

      t.timestamps
    end
  end
end
