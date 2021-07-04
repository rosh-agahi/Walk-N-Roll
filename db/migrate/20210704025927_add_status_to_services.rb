class AddStatusToServices < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :status, :boolean
  end
end
