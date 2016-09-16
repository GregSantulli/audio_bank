class AddAttachmentAudioToSamples < ActiveRecord::Migration
  def self.up
    change_table :samples do |t|
      t.attachment :audio
    end
  end

  def self.down
    remove_attachment :samples, :audio
  end
end
