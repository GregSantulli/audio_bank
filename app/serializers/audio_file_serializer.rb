class AudioFileSerializer < ActiveModel::Serializer
  attributes :id, :name, :url

  def url
    object.url_for(:get)
  end



end
