class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.datetime :apptdate
      t.string :service
      t.belongs_to :dog, foreign_key: true
      t.belongs_to :dogwalker, foreign_key: true

      t.timestamps
    end
  end
end
