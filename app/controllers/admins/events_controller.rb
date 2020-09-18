class Admins::EventsController < ApplicationController
  before_action :authenticate_admin!

  def index
  	@events = Event.all
  end

  def show
  	@event = Event.find(params[:id])
  end

  def edit
  	@event = Event.find(params[:id])
  end

  def update
  	@event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = "イベントを更新しました"
      redirect_to admins_event_path(@event)
    else
      flash[:notice] = "イベントを更新できませんでした"
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
  	@event.destroy
  	 flash[:notice] = "イベントを削除しました"
  	 redirect_to admins_events_path
  end



  private

    def event_params
      params.require(:event).permit(:user_id, :title, :artist, :image ,:Introduction ,:start_date ,:end_date ,:place,:address,:event_url,:price ).merge(hold_status: params[:event][:hold_status].to_i)
    end


end