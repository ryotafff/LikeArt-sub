class EventsController < ApplicationController
  before_action :authenticate_user!,except: [:index]

  def index
    # @events = Event.all
    @events = Event.includes(:user, :post_comments, :likes)
    @events = Event.where(hold_status: ["0","1"]).order(created_at: :desc).page(params[:page]).per(6) #where文で開催ステータスが開催中と開催予定のものだけ表示させる/6件ごとにページ作成
    @event = Event.new
    @user = current_user
    @search = Event.ransack(params[:q])
    @events = @search.result.order(created_at: :desc).page(params[:page]).per(6)
  end


  def show
    @event = Event.find(params[:id])
    @event_new = Event.new
    @post_comment = PostComment.new
    @post_comments = @event.post_comments
  end

  def new
    @event = Event.new
  end


  def create
    @event = current_user.events.new(event_params)
    if @event.save
      flash[:notice] = 'イベントが保存されました！'
      redirect_to events_path
    else
      @events = Event.all
      render 'new'
      flash[:notice] = 'イベントを保存できませんでした。'
    end
  end


  def edit
    @event = Event.find(params[:id])
    if @event.user != current_user
      redirect_to events_path
    end
  end



  def update
       @event = Event.find(params[:id])
    if @event.update(event_params)
       flash[:notice] = 'イベントを更新しました！'
       redirect_to event_path(@event)
    else
      @events = Event.all
      render 'edit'
    end
  end


  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
    flash[:notice] = 'イベントを削除しました。'
  end



  private
    def event_params
      params.require(:event).permit(:user_id, :title, :artist, :image ,:Introduction ,:start_date ,:end_date ,:place,:address,:event_url,:price,:latitude,:longitude,:StartTime,:EndTime ).merge(hold_status: params[:event][:hold_status].to_i)
    end

end
