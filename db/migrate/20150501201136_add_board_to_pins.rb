class AddBoardToPins < ActiveRecord::Migration
  def change
    add_reference :pins, :board, index: true
    add_foreign_key :pins, :boards
  end
end
