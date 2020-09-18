class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
  	@users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  	  flash[:notice] = "会員情報が更新されました"
  	  redirect_to admins_user_path(@user)
    else
       flash[:notice] = "会員情報が更新できませんでした"
       render :edit
    end
  end


  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	 flash[:notice] = "会員を削除しました"
  	 redirect_to admins_users_path
  end


  private

  def user_params
  	params.require(:user).permit(:email, :name, :profile_image, :biography)
  end


end
