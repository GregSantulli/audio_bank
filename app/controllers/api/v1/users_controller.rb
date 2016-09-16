class Api::V1::UsersController < ApplicationController

  before_action :authenticate_api_v1_user!



  def index
    render json: {}
  end

  def show
    render json: current_api_v1_user
  end


end
