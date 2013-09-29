class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.datetime :start_time
      t.datetime :stop_time
      t.string :room
      t.text :abstract
      t.integer :row_span
      t.integer :position

      t.timestamps
    end
  end
end
