class ArtworksController < ApplicationController
  before_action :authenticate_user!,except: [:index]


  def index
    # @artworks = Artwork.all
    @artworks = Artwork.includes(:user, :post_comments, :likes).order(created_at: :desc).page(params[:page]).per(9)
    @artwork = Artwork.new
    @user = current_user
    #タグ絞り込み
    if params[:tag]
      @artworks = Artwork.tagged_with("#{params[:tag]}").order(created_at: :desc).page(params[:page]).per(9)
    end
  end

  def show
    @artwork = Artwork.find(params[:id])
    @artwork_new = Artwork.new
    @post_comment = PostComment.new
    @post_comments = @artwork.post_comments
  end

  def new
    @artwork = Artwork.new
  end


  def edit
    @artwork = Artwork.find(params[:id])
    if @artwork.user != current_user
      redirect_to artworks_path
    end
  end


  def create
    @artwork = current_user.artworks.new(artwork_params)
   if @artwork.save
    flash[:notice] = '作品が保存されました！'
    redirect_to artworks_path
    else
      @artworks = Artwork.all
      render 'new'
      flash[:notice] = '作品を保存できませんでした。'
     end
  end


  def update
    @artwork = Artwork.find(params[:id])
    if @artwork.update(artwork_params)
      flash[:notice] = '作品を更新しました！'
      redirect_to artwork_path(@artwork)
    else
      render 'edit'
      flash[:notice] = '作品を更新できませんでした。'
    end
  end


  def destroy
    @artwork = Artwork.find(params[:id])
    @artwork.destroy
    redirect_to artworks_path
    flash[:notice] = '作品を削除しました。'
  end


  private
    def artwork_params
      params.require(:artwork).permit(:user_id, :title, :artist_name, :image ,:Introduction ,:tag_list)
    end


end
