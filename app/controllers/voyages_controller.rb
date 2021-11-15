class VoyagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @voyages = Voyage.order(description: :desc)
    @Users = User.order(:email)
    @profiles = Profile.order(:name)

  end

  def new
    if current_user.voyage.nil?
      @voyage = Voyage.new
      @profiles = Profile.order(:name)
    else
      redirect_to voyages_path
    end
  end

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

  def show
    @voyage = Voyage.find(params[:id])
  end

  def edit
    @voyage = Voyage.find(params[:id])
    @profiles = Profile.order(:name)
    p "blah"
    p "blah"
    p "blah"
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

  def join
    @voyage = Voyage.find(params[:id])
    p 'blah'
    # @voyage.appliers << current_user.profile
    # redirect_to @voyage
  end
  
  # def leave
  #   @team = Team.find params[:id]
  #   current_user.update_attribute(:team_id, nil)
  #   redirect_to @team
  # end

  def voyage_params 
    params.require(:voyage).permit(:description, :launch, :voyage, :profile_id, :voyage_image)
  end
end
