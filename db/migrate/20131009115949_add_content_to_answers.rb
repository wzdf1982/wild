class AddContentToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :content, :text
  end
end
