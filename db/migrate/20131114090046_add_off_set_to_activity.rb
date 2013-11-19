class AddOffSetToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :off_set, :integer
  end
end
