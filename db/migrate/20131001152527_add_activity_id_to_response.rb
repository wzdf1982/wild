class AddActivityIdToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :activity_id, :integer
  end
end
