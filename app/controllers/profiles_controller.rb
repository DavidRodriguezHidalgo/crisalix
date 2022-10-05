class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = current_user.profile
  end

  def check_external
    @profile = User.find(params[:id]).profile
    render :show
  end
end
