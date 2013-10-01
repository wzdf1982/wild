class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :type
      t.string :name
      t.string :selected
      t.text :comment
      t.integer :question_id

      t.timestamps
    end
  end
end
