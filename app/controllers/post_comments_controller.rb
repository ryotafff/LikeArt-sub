class PostCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = Event.find(params[:event_id])
    @post_comment = current_user.post_comments.new(post_comment_params)
    @post_comment.event_id = @event.id
     # binding.pry
	if @post_comment.save
	   flash[:success] = "Comment was successfully created."
	end
	  # redirect_to request.referer
  end


  def destroy
    @event = Event.find(params[:event_id])
    post_comment = current_user.post_comments.find_by(id: params[:id], event_id: @event.id)
    post_comment.destroy
    # redirect_to request.referer
  end


  def save
    @artwork = Artwork.find(params[:artwork_id])
    @post_comment = current_user.post_comments.new(post_comment_params)
    @post_comment.artwork_id = @artwork.id
    if @post_comment.save
	  flash[:success] = "Comment was successfully created."
    end
      # redirect_to request.referer
  end


  def delete
    @artwork = Artwork.find(params[:artwork_id])
    post_comment = current_user.post_comments.find_by(id: params[:id], artwork_id: @artwork.id)
    post_comment.destroy
    # redirect_to request.referer
  end


  private
    def post_comment_params
	  params.require(:post_comment).permit(:comment)
	end

end
