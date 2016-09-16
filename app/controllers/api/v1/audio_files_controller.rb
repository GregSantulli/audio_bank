class Api::V1::AudioFilesController < ApplicationController

  respond_to :json
  skip_before_filter  :verify_authenticity_token

  def index

    @audio_files = AudioFile.all
    render json: @audio_files

  end



  def create
    audio = AudioFile.new(create_params)
    if audio.save
      render json: audio, status: 201
    else
      render json: audio, status: 400
    end
  end

  def show

  end



  private


  def create_params
    params.require(:audio_file).permit(:name, :size, :type)
  end


end
