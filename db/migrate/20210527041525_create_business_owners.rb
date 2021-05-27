class CreateBusinessOwners < ActiveRecord::Migration[6.1]
  def change
    create_table :business_owners do |t|
      t.string :username
      t.string :password_digest
      t.string :business_join_code
      t.string :name

      t.timestamps
    end
  end
end
