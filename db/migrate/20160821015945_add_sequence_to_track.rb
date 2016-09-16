class AddSequenceToTrack < ActiveRecord::Migration
  def change
    add_reference :tracks, :sequence, index: true
  end
end
