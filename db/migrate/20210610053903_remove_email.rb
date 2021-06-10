class RemoveEmail < ActiveRecord::Migration[6.1]
  def change
    remove_column :business_owners, :email, :string

  end
end
