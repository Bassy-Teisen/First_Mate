class BoatsController < ApplicationController
  def index
    @boats = Boat.order(category: :desc)
  end

  def new
  end

  def create
  end

  def show
    @boat = Boat.find(params[:id])
  end

  def edit
  end

  def update
    @boat = Boat.find(params[:id])
    @boat.update(boat_params)
    redirect_to @boat
  end

  def destroy
  end
end
