class RenameSamplesToAudioFiles < ActiveRecord::Migration
  def change
    rename_table :samples, :audio_files
    rename_column :tracks, :sample_id, :audio_file_id
  end
end
