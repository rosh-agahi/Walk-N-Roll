class AddTipsToAppointment < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :tip, :integer
  end
end
