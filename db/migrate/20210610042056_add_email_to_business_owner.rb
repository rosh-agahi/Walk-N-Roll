class AddEmailToBusinessOwner < ActiveRecord::Migration[6.1]
  def change
    add_column :business_owners, :email, :string

  end
end
