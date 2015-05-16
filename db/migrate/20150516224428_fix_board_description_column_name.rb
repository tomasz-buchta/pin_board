class FixBoardDescriptionColumnName < ActiveRecord::Migration
  def change
    rename_column :boards, :desription, :description
  end
end
