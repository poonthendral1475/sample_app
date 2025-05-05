class ChangeAgeTypeToFloatInDummies < ActiveRecord::Migration[6.1]
  def change
  change_column :dummies, :age, :integer, using: 'age::integer'

  end
end
