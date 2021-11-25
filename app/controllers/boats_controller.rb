class BoatsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_boat, only: [:show, :edit, :update, :destroy]
  before_action :check_valid

  def index
    @boats = Boat.order(category: :desc)
  end

  def new
    if current_user.profile.boat.nil?
      @boat = Boat.new
      @profiles = Profile.order(:name)
    else
      redirect_to user_session_path
    end
  end

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

  def show
  end

  def edit
    @profiles = Profile.order(:name)
  end

  def update
    begin 
      @boat.update!(boat_params)
      redirect_to @boat
    rescue
      flash.now[:errors] = @boat.errors.messages.values.flatten
      render 'edit'
    end
  end

  def destroy
    @boat.destroy
    redirect_to boats_path
  end

  private

  def boat_params 
    params.require(:boat).permit(:category, :size, :capasity, :activity, :profile_id, :boat_image)
  end

  def set_boat
    @boat = Boat.find(params[:id])
  end

  def check_valid
    authorize @boat || Boat    
  end

end
