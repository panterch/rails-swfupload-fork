class PhotosController < ApplicationController

  protect_from_forgery :except => :swfupload
  
  def index
    @photos = Photo.find_all_by_parent_id(nil)
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def swfupload
    # swfupload action set in routes.rb
    @photo = Photo.new :uploaded_data => params[:Filedata]
    @photo.save!
    render :text => @photo.public_filename(:thumb)
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_url
  end
end
