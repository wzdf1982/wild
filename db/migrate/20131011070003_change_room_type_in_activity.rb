class ChangeRoomTypeInActivity < ActiveRecord::Migration
  def change
    change_column :activities, :room, :text
  end
end
