class AddUserToBoards < ActiveRecord::Migration
  def change
    add_reference :boards, :user, index: true
    add_foreign_key :boards, :users
  end
end
