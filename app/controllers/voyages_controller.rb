class VoyagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_voyage, only: [:show, :edit, :update, :destroy, :join]
  before_action :check_valid

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
  end

  def edit
    @profiles = Profile.order(:name)
  end

  def update
    begin 
      @voyage.update!(voyage_params)
      redirect_to @voyage
    rescue
      flash.now[:errors] = @voyage.errors.messages.values.flatten
      render 'edit'
    end
  end

  def destroy
    @voyage.destroy
    redirect_to voyages_path
  end

  def join
    @applied_voyage = AppliedVoyage.new()
  end

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
      # @voyage.appliers << current_user 
      redirect_to voyage_path(@voyage)
    end
  end

  private

  def voyage_params 
    params.require(:voyage).permit(:description, :launch, :voyage, :profile_id, :voyage_image)
  end

  def set_voyage
    @voyage = Voyage.find(params[:id])
  end

  def check_valid
    authorize @voyage || Voyage
  end
end
