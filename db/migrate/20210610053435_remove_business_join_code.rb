class RemoveBusinessJoinCode < ActiveRecord::Migration[6.1]
  def change
    remove_column :business_owners, :business_join_code, :string

  end
end
