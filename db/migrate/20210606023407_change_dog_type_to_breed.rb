class ChangeDogTypeToBreed < ActiveRecord::Migration[6.1]
  def change
    remove_column :dogs, :type, :string
    add_column :dogs, :breed, :string
  end
end
