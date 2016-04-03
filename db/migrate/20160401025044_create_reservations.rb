class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :first_name
      t.string :last_name
      t.string :confirmation
      t.datetime :flight_time

      t.timestamps null: false
    end
  end
end
