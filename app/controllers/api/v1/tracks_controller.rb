class Api::V1::TracksController < ApplicationController

  # before_action :authenticate_user!
  skip_before_filter  :verify_authenticity_token

  respond_to :json


  def index
    @tracks = Track.all
    render json: @tracks
  end

  def create
    p params
    track = Track.new(track_params)
    if track.save
      render json: track, status: 201
    else
      render json: track.errors.full_messages, status: 400
    end
  end


  private

  def track_params
    p params
    # p JSON.parse(request.body)
    params.require(:track).permit(:name, :pattern, :audio_file_id)
  end


end
