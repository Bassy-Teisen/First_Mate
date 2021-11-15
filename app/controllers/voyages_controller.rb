class VoyagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @voyages = Voyage.order(description: :desc)
  end

  def new
    if current_user.profile.voyage.nil?
      @voyage = Voyage.new
      @profiles = Profile.order(:name)
    else
      redirect_to voyages_path
    end
  end

  def create
    if current_user.profile.voyage.nil?
      @voyage = Voyage.new(voyage_params)
      @voyage.profile_id = current_user.profile.id
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

  def show
    @voyage = Voyage.find(params[:id])
  end

  def edit
    @voyage = Voyage.find(params[:id])
    @profiles = Profile.order(:name)
  end

  def update
    @voyage = Voyage.find(params[:id])
    begin 
      @voyage.update!(voyage_params)
      redirect_to @voyage
    rescue
      flash.now[:errors] = @voyage.errors.messages.values.flatten
      render 'edit'
    end
  end

  def destroy
    @voyage = Voyage.find(params[:id])
    @voyage.destroy
    redirect_to voyages_path
  end

  def voyage_params 
    params.require(:voyage).permit(:description, :profile_id, :voyage_image)
  end
end
