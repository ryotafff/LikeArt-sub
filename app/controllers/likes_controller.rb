class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = Event.find(params[:event_id])
    like = current_user.likes.new(event_id: @event.id)
    like.save
    # redirect_to request.referer
  end


  def destroy
    @event = Event.find(params[:event_id])
    like = current_user.likes.find_by(event_id: @event.id)
    like.destroy
    # redirect_to request.referer
  end


  def make
    @artwork = Artwork.find(params[:artwork_id])
    like = current_user.likes.new(artwork_id: @artwork.id)
    like.save
    # redirect_to request.referer
  end

  def erase
    @artwork = Artwork.find(params[:artwork_id])
    like = current_user.likes.find_by(artwork_id: @artwork.id)
    like.destroy
    # redirect_to request.referer
  end

end
