class BoatsController < ApplicationController

  # This authenticates the user and enables a user to look at index and show without being loged in
  before_action :authenticate_user!, except: [:index, :show]
  # This finds the specific boat acording to params for all these actions
  before_action :set_boat, only: [:show, :edit, :update, :destroy]
  # This authenticates through the pundit policy
  before_action :check_auth

 
  # Uses get request to displays all the boats for the index page and displays them in descending aplahpabetical order
  def index
    @boats = Boat.order(category: :desc)
  end
  
  # Uses get request to displays the new boat page with the form, where the user can enter data for the new boat
  def new
    if current_user.profile.boat.nil?
      @boat = Boat.new
      @profiles = Profile.order(:name)
    else
      redirect_to user_session_path
    end
  end

  # This is where the boat is created with a post request. If current user doesn't have a boat, a new boat can be created with a foriegn key for user id, when created the model will store the new boat in the data base, also contains validation for data to prevent the wrong data type being entered
  def create
    if current_user.profile.boat.nil?
      @boat = Boat.new(boat_params)
      @boat.profile_id = current_user.profile.id
      begin
      @boat.save!
      redirect_to @boat  
      rescue
        flash.now[:errors] = @boat.errors.messages.values.flatten
        render 'new'
      end
    else
      redirect_to @boat
    end
  end

  # Show page get request which displays the individual boat using the find(params[:id]) method for finding specific boat
  def show
  end

  # Edit page get request which displays the individual boat using the find(params[:id]) method for finding specific boat
  def edit
    @profiles = Profile.order(:name)
  end

  # A patch request is made to the boat any changes made will be saved to the data base and any errors displayed  
  def update
    begin 
      @boat.update!(boat_params)
      redirect_to @boat
    rescue
      flash.now[:errors] = @boat.errors.messages.values.flatten
      render 'edit'
    end
  end

  # This is a delete request where the action will delete boat from the data base
  def destroy
    @boat.destroy
    redirect_to boats_path
  end

  # For any methods that can't be accesed from outside the controller
  private

  # This permits the specified attribute to interact with the controller actions
  def boat_params 
    params.require(:boat).permit(:category, :size, :capasity, :activity, :profile_id, :boat_image)
  end

  # This is used to minmise the amount of times this method is called and is set in the before action
  def set_boat
    @boat = Boat.find(params[:id])
  end

  # This is pundits authorization for the acitons that can be done by the user
  def check_auth
    authorize @boat || Boat    
  end
end
