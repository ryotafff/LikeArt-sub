class Admins::ArtworksController < ApplicationController
  before_action :authenticate_admin!

  def index
  	@artworks = Artwork.all
  end

  def show
  	@artwork = Artwork.find(params[:id])
  end

  def edit
  	@artwork = Artwork.find(params[:id])
  end

  def update
  	@artwork = Artwork.find(params[:id])
    if @artwork.update(artwork_params)
      flash[:notice] = "作品を更新しました"
      redirect_to admins_artwork_path(@artwork)
    else
      flash[:notice] = "作品を更新できませんでした"
      render :edit
    end
  end



  def destroy
  	@artwork = Artwork.find(params[:id])
    @artwork.destroy
    redirect_to admins_artworks_path
    flash[:notice] = '作品を削除しました。'
  end




  private

    def artwork_params
      params.require(:artwork).permit(:user_id, :title, :artist_name, :image ,:Introduction ,:tag_list)
    end


end
