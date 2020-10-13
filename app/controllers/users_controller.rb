class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
  	@user = User.find(params[:id])
    @artworks = Artwork.where(user_id: params[:id])
    @events = Event.where(user_id: params[:id])
  end


  def edit
  end


  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "会員情報を更新しました"
    else
      render "edit"
    end
  end



  def follows
  end

  def followers
  end



  private
    def user_params
      params.require(:user).permit(:email, :name, :profile_image, :biography)
    end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end


end
