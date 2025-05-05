class AddHeightToDummies < ActiveRecord::Migration[6.1]
  def change
    add_column :dummies, :height, :integer
  end
end
