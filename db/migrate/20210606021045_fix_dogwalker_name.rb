class FixDogwalkerName < ActiveRecord::Migration[6.1]
  def change
    remove_column :dogwalkers, :name, :integer
    add_column :dogwalkers, :name, :string
  end
end
