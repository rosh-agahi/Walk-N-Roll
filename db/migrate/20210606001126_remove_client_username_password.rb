class RemoveClientUsernamePassword < ActiveRecord::Migration[6.1]
  def change
    change_table :clients do |t|
      t.remove :username, :password_digest
    end 
  end
end
