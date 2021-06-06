class ChangeAppointmentServicetoInteger < ActiveRecord::Migration[6.1]
  def change
    remove_column :appointments, :service, :string
    add_column :appointments, :service_id, :integer
  end
end
