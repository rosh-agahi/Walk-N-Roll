class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.string :description
      t.string :price
      t.integer :business_owner_id
    end
  end
end
