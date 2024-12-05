class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: [:show]


  def index
    @chatrooms = current_user.chatrooms
  end

  def show
    @message = Message.new
    @users = User.where.not(id: current_user.id)
    @chatrooms = Chatroom.where("user_1_id = :user_id OR user_2_id = :user_id", user_id: current_user.id)
    @chatroom.messages.where(sender: @chatroom.other_user(current_user), reading: false).update_all(reading: true)
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    @chatroom.user_1 = current_user

    if @chatroom.save
      redirect_to chatroom_path(@chatroom), notice: 'Chatroom was successfully created.'
    else
      redirect_to dashboard_searches_path, alert: "Impossible de créer la conversation"
    end
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
    unless @chatroom.user_1 == current_user || @chatroom.user_2 == current_user
      redirect_to root_path, alert: "You don't have access to this chat"
    end
  end

  def chatroom_params
    params.require(:chatroom).permit(:name, :user_2_id)
  end
end
