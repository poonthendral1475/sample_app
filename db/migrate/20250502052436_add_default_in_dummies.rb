class AddDefaultInDummies < ActiveRecord::Migration[6.1]
  def change
    add_column :dummies, :status , :string, default: "active", null: false
  end
end
