class GalleriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @galleries = Gallery.order(description: :desc)
    @Users = User.order(:email)
    @profiles = Profile.order(:name)
  end

  def new
    if current_user.gallery.nil?
      @gallery = Gallery.new
      @profiles = Profile.order(:name)
    else
      redirect_to galleries_path
    end
  end

  def create
    if current_user.gallery.nil?
      @gallery = Gallery.new(gallery_params)
      @gallery.user_id = current_user.id
      begin
      @gallery.save!
      redirect_to @gallery  
      rescue
        flash.now[:errors] = @gallery.errors.messages.values.flatten
        render 'new'
      end
    else
      redirect_to @gallery
    end
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def edit
    @gallery = Gallery.find(params[:id])
    @profiles = Profile.order(:name)
  end

  def update
    @gallery = Gallery.find(params[:id])
    begin 
      @gallery.update!(gallery_params)
      redirect_to @gallery
    rescue
      flash.now[:errors] = @gallery.errors.messages.values.flatten
      render 'edit'
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    redirect_to galleries_path
  end

  def gallery_params 
    params.require(:gallery).permit(:description, :launch, :voyage, :profile_id, :voyage_image)
  end

end
