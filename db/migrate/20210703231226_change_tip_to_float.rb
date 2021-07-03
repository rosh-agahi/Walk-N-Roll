class ChangeTipToFloat < ActiveRecord::Migration[6.1]
  def change
    remove_column :appointments, :tip, :integer
    add_column :appointments, :tip, :float
  end
end
