class ChangeEmailNullInDummies < ActiveRecord::Migration[6.1]
  def change
    change_column :dummies, :email, :string, null: false
  end
end
