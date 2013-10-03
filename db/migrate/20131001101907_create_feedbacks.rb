class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :title
      t.integer :user_id
      t.integer :activity_id

      t.timestamps
    end
  end
end
