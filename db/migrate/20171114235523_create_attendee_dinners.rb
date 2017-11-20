class CreateAttendeeDinners < ActiveRecord::Migration[5.1]
  def change
    create_table :attendee_dinners do |t|
      t.bigint :attendee_id
      t.bigint :dinner_id

      t.timestamps
    end
  end
end
