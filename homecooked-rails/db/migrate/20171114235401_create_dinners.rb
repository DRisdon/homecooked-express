class CreateDinners < ActiveRecord::Migration[5.1]
  def change
    create_table :dinners do |t|
      t.datetime :starts_at
      t.string :location

      t.timestamps
    end
  end
end
