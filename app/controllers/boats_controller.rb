class BoatsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
    @boat = Boat.find(params[:id])
  end

  def edit
    @boat = Boat.find(params[:id])
    @profiles = Profile.order(:name)
  end

  def update
    @boat = Boat.find(params[:id])
    begin 
      @boat.update!(boat_params)
      redirect_to @boat
    rescue
      flash.now[:errors] = @boat.errors.messages.values.flatten
      render 'edit'
    end
  end

  def destroy
    @boat = Boat.find(params[:id])
    @boat.destroy
    redirect_to boats_path
  end

  def boat_params 
    params.require(:boat).permit(:category, :size, :capasity, :activity, :profile_id)
  end
end
