class RemoveColumnsFromAnswers < ActiveRecord::Migration
  def change
    remove_column :answers, :type
    remove_column :answers, :comment
    change_column :answers, :selected, :boolean
  end
end
