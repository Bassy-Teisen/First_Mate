class ProfilesController < ApplicationController

  # This authenticates through the pundit policy
  before_action :authenticate_user!, except: [:index, :show]
  # This finds the specific boat acording to params for all these actions
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  # This authenticates through the pundit policy
  before_action :check_auth
  
  # Uses get request to displays all the profiles for the index page and displays them in descending aplahpabetical order
  def index
    @profiles = Profile.order(name: :desc)
  end

  # Uses get request to displays the new profile page, with the form where the user can enter data for the new profile
  def new
    if current_user.profile.nil?
      @profile = Profile.new
    else
      redirect_to user_session_path
    end
  end

  # This is where the profile is created with a post request. If current user doesn't have a profile, a new profile can be created with a foriegn key for user id, when created the model will store the new profile in the data base, also contains validation for data to prevent the wrong data type being entered
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

  # Show page get and displays the individual profile using the find(params[:id]) method for finding specific profile
  def show
  end

  # Edit page get and displays the individual profile using the find(params[:id]) method for finding specific profile
  def edit
    @boat = Boat.order(:category)
  end

  # A patch request is made to the profile any changes made will be saved to the data base and any errors displayed  
  def update  
    begin 
      @profile.update!(profile_params)
      redirect_to @profile    
    rescue
      flash.now[:errors] = @profile.errors.messages.values.flatten
      render 'edit'
    end
  end

  # This is a delete request where the action will delete profile from the data base
  def destroy
    @profile.destroy
    redirect_to profiles_path
  end

  # For any methods that can't be accesed from outside the controller
  private

  # This permits the specified attribute to interact with the controller actions
  def profile_params 
    params.require(:profile).permit(:name, :phone_number, :captain, :description, :email, :user_id, :profile_image )
  end
 
  # This is used to minmise the amount of times this method is called and is set in the before action
  def set_profile
    @profile = Profile.find(params[:id])
  end
 
  # This is pundits authorization for the acitons that can be done by the user
  def check_auth
    authorize @profile || Profile
  end
end
