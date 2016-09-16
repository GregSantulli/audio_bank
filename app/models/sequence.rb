class Sequence < ActiveRecord::Base

  has_many :sequence_tracks
  has_many :tracks

  accepts_nested_attributes_for :tracks

end
