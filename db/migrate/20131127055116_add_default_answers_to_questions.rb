class AddDefaultAnswersToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :default_answers, :string
  end
end
