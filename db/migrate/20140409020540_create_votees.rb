class CreateVotees < ActiveRecord::Migration
  def change
    create_table :votees do |t|
      t.string :title

      t.timestamps
    end
  end
end
