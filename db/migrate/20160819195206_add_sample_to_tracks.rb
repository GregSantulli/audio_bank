class AddSampleToTracks < ActiveRecord::Migration
  def change
    add_reference :tracks, :sample, index: true
  end
end
