class AddUniqueIndexToEmailInDummies < ActiveRecord::Migration[6.1]
  def change
    add_index :dummies, :email, unique: true
  end
end
