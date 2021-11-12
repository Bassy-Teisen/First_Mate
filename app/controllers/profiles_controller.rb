class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_profile, only: [:new, :edit, :create]
  
  def index
    @profiles = Profile.order(name: :desc)
    # @boats = Boat.order(:category)
  end

 def new
    if current_user.profile.nil?
      @profile = Profile.new
      @users = User.order(:email)
    else
      redirect_to user_session_path
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def create
    if current_user.profile.nil?
      @profile = Profile.new(profile_params)
      @profile.user_id = current_user.id
      begin
        @profile.save!
        redirect_to @profile
      rescue
        flash.now[:errors] = @profile.errors.messages.values.flatten
        render 'new'
      end
    else
      redirect_to @profile    
    end
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update!(profile_params)
    redirect_to @profile
  end

  def edit
    @profile = Profile.find(params[:id])
    @boat = Boat.order(:category)
   
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    redirect_to profiles_path

  end

  def profile_params 
    params.require(:profile).permit(:name, :phone_number, :captain, :description, :email, :user_id )
  end
 
  def set_profile
    @profile = Profile.order(:name)
  end
end
