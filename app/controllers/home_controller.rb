class HomeController < ApplicationController
  before_filter :disable_header, only: []

  def index
    # @user = User.find_by_id(1)
    # render json: @user
  end
end
