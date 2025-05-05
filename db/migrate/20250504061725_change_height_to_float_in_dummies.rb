class ChangeHeightToFloatInDummies < ActiveRecord::Migration[6.1]
  def up
    change_column :dummies, :height, :float, using: 'height::float'
  end

  def down
    change_column :dummies, :height, :integer, using: 'height::integer'
  end
end
