class AddFeedbackIdToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :feedback_id, :integer
  end
end
