class CreateDogs < ActiveRecord::Migration[6.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :type
      t.integer :age
      t.string :favorite_treat
      t.belongs_to :client, foreign_key: true

      t.timestamps
    end
  end
end
