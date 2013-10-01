class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.integer :postion
      t.integer :activity_id

      t.timestamps
    end
  end
end
