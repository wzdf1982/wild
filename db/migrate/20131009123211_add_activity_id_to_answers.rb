class AddActivityIdToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :activity_id, :integer
  end
end
