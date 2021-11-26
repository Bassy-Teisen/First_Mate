class VoyagesController < ApplicationController

  # This authenticates through the pundit policy
  before_action :authenticate_user!, except: [:index, :show]
  # This finds the specific boat acording to params for all these actions
  before_action :set_voyage, only: [:show, :edit, :update, :destroy, :join, :joiner]
  # This authenticates through the pundit policy
  before_action :check_auth

  # Uses get request to displays all the voyages for the index page and displays them in descending aplahpabetical order
  def index
    @voyages = Voyage.order(description: :desc)
    @Users = User.order(:email)
    @profiles = Profile.order(:name)
  end

  # Uses get request to displays the new voyage page, with the form where the user can enter data for the new voyage
  def new
    if current_user.voyage.nil?
      @voyage = Voyage.new
      @profiles = Profile.order(:name)
    else
      redirect_to voyages_path
    end
  end

  # If current user doesn't have a voyage a new voyage can be created, also contains validation 
  # This is where the voyage is created with a post request. If current user doesn't have a voyage, a new voyage can be created with a foriegn key for user id, when created the model will store the new voyage in the data base, also contains validation for data to prevent the wrong data type being entered
  def create
    if current_user.voyage.nil?
      @voyage = Voyage.new(voyage_params)
      @voyage.user_id = current_user.id
      begin
      @voyage.save!
      redirect_to @voyage  
      rescue
        flash.now[:errors] = @voyage.errors.messages.values.flatten
        render 'new'
      end
    else
      redirect_to @voyage
    end
  end

  # Show page get request which displays the individual voyage using the find(params[:id]) method for finding specific voyage
  def show
  end

  # Edit page get request which displays the individual voyage using the find(params[:id]) method for finding specific voyage
  def edit
    @profiles = Profile.order(:name)
  end

  # A patch request is made to the voyage any changes made will be saved to the data base and any errors displayed  
  def update
    begin 
      @voyage.update!(voyage_params)
      redirect_to @voyage
    rescue
      flash.now[:errors] = @voyage.errors.messages.values.flatten
      render 'edit'
    end
  end

  # This is a delete request where the action will delete voyage from the data base
  def destroy
    @voyage.destroy
    redirect_to voyages_path
  end

  # This renders the join
  # Join page get request which displays the individual voyage using the find(params[:id]) method for finding specific voyage
  def join
    @applied_voyage = AppliedVoyage.new()
  end

  # This is where the user applies to join the voyage, a post request is made to the data base where the user id, the voyage id and their discription is entered posted into the applied_voyage table
  def joiner
    @voyage = Voyage.find(params[:id])
    they_are_already_attached = @voyage.appliers.find_by(id: current_user.id)
    if they_are_already_attached
      flash[:notice] = "You cannot do that"
      render "show"
    else
      @applied_voyage = AppliedVoyage.new(description: params[:applied_voyage][:description])
      @applied_voyage.user = current_user
      @applied_voyage.voyage = @voyage
      @applied_voyage.save!
      redirect_to voyage_path(@voyage)
    end
  end

  # For any methods that can't be accesed from outside the controller
  private

  # This permits the specified attribute to interact with the controller actions
  def voyage_params 
    params.require(:voyage).permit(:description, :launch, :voyage, :profile_id, :voyage_image)
  end

  # This is used to minmise the amount of times this method is called and is set in the before action
  def set_voyage
    @voyage = Voyage.find(params[:id])
  end

  # This is pundits authorization for the acitons that can be done by the user
  def check_auth
    authorize @voyage || Voyage
  end
end
