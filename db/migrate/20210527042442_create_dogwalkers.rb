class CreateDogwalkers < ActiveRecord::Migration[6.1]
  def change
    create_table :dogwalkers do |t|
      t.integer :name
      t.belongs_to :business_owner, foreign_key: true

      t.timestamps
    end
  end
end
