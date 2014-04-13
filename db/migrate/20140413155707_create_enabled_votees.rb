class CreateEnabledVotees < ActiveRecord::Migration
  def change
    create_table :enabled_votees do |t|
      t.integer :votee_id

      t.timestamps
    end
  end
end
