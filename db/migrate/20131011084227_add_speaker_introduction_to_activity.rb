class AddSpeakerIntroductionToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :speaker_introduction, :text
  end
end
