class BoatsController < ApplicationController
  def index
    @boats = Boat.order(category: :desc)
  end

  def new
    @boat = Boat.new
    @profiles = Profile.order(:name)
  end

  def create
    # render json: boat_params
    @boat = Boat.new(boat_params)
    @boat.save
    redirect_to @boat   
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
    @boat.update(boat_params)
    redirect_to @boat
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
