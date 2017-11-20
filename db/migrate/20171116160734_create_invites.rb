class CreateInvites < ActiveRecord::Migration[5.1]
  def change
    create_table :invites do |t|
      t.bigint :invited_id
      t.bigint :dinner_id
      t.timestamps
    end
  end
end
