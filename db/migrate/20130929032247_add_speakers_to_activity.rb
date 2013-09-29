class AddSpeakersToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :speakers, :text
  end
end
