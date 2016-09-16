
class Api::V1::SequencesController < ApplicationController

  before_action :get_sequence, only: [:update]

  def index
    sequence = Sequence.first
    render json: sequence
  end

  def create

  end

  def update
    @sequence.update_attributes(sequence_params)
    render json: @sequence
  end

  private

  def get_sequence
    p params
    @sequence = Sequence.find(params[:id])
  end

  def sequence_params
    params.require(:sequence).permit(:name, tracks_attributes: [:id, :pattern])
  end


end
