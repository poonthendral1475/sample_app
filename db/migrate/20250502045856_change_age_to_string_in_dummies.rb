class ChangeAgeToStringInDummies < ActiveRecord::Migration[6.1]
  def up
    change_column :dummies, :age, :string
  end
end
