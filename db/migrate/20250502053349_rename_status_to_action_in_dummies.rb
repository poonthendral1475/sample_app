class RenameStatusToActionInDummies < ActiveRecord::Migration[6.1]
  def change
    rename_column :dummies, :status, :action
  end
end
