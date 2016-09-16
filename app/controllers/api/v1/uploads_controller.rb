class Api::V1::UploadsController < ApplicationController

  def create
    filename = create_params[:filename]
    object = BUCKET.object(filename)
    url = object.presigned_url(:put).to_s
    render json: {url: url, filename: filename}
  end

  private

  def create_params
    params.require(:upload).permit(:filename)
  end

end