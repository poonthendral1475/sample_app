class ChangeAgeTypeInDummies < ActiveRecord::Migration[6.1]
  def change
    change_column :dummies, :age, :string
  end
end
