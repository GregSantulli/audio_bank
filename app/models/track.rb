class Track < ActiveRecord::Base

  belongs_to :audio_file
  belongs_to :sequence


end
