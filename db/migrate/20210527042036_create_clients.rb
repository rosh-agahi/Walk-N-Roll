class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :username
      t.string :password_digest
      t.integer :phonenumber
      t.string :address
      t.belongs_to :business_owner, foreign_key: true

      t.timestamps
    end
  end
end
