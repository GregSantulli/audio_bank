class AudioFile < ActiveRecord::Base

  has_attached_file :audio
    validates_attachment_content_type :audio, content_type: /\Aaudio\/.*\Z/

  has_many :tracks


  def url_for(method)
    object = BUCKET.object(self.name)
    object.presigned_url(method).to_s
  end

end
