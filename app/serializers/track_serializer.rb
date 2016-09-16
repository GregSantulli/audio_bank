class TrackSerializer < ActiveModel::Serializer
  attributes :id, :pattern, :audio_file

  def audio_file
    AudioFileSerializer.new(object.audio_file)
  end


end
