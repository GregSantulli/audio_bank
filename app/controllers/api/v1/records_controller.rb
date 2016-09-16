class Api::V1::RecordsController < ApplicationController

  before_action :authenticate_user!

  def index
    @samples = Sample.all
    p current_user
    render json: {great: "success!!!!"}
  end


end
