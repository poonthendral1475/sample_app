class AddEmailToDummies < ActiveRecord::Migration[6.1]
  def change
    add_column :dummies , :email, :string
  end
end
