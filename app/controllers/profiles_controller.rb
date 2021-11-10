class ProfilesController < ApplicationController
  before_action :set_profile, only: [:new, :edit]
  
  def index
    @profiles = Profile.order(name: :desc)
  end

  def new
    @profiles = Profile.new
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def create
  #  render json: profile_params 
    @profile = Profile.new(profile_params)
    @profile.save
    redirect_to @profile    
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(profile_params)
    redirect_to @profile
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def destroy
  end

  def profile_params 
    params.require(:profile).permit(:name, :phone_number, :captain, :description, :email )
  end
 
  def set_profile
    @profile = Profile.order(:name)
  end
end
