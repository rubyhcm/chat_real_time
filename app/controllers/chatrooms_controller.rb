class ChatroomsController < ApplicationController
  before_action :load_chatroom, only: [:edit, :update, :show]

  def index
    @chatroom = Chatroom.new
    @chatrooms = Chatroom.all
  end

  def new
    clear_flash_if_from_chatrooms
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      respond_to do |format|
        format.html { redirect_to @chatroom }
        format.js
      end
    else
      handle_chatroom_creation_error
    end
  end

  def edit
  end

  def update
    if @chatroom.update(chatroom_params)
      redirect_to @chatroom
    else
      handle_chatroom_update_error
    end
  end

  def show
    @message = Message.new
  end

  private

  def load_chatroom
    @chatroom = Chatroom.find_by(slug: params[:slug])
  end

  def chatroom_params
    params.require(:chatroom).permit(:topic)
  end

  def clear_flash_if_from_chatrooms
    flash[:notice] = nil if request.referrer.split("/").last == "chatrooms"
    # request.referrer lấy URL của trang web trước đó mà người dùng đã đến từ.
    # request.referrer.split("/") chia URL thành một mảng các phần, sử dụng dấu gạch chéo (/) làm điểm phân chia.
    # Ví dụ, nếu URL là https://example.com/chatrooms/new, mảng sẽ chứa ["https:", "", "example.com", "chatrooms", "new"].
  end

  def handle_chatroom_creation_error
    flash[:notice] = { error: ["A chatroom with this topic already exists"] }
    respond_to do |format|
      format.html { redirect_to new_chatroom_path }
      format.js { render template: 'chatrooms/chatroom_error.js.erb' }
    end
  end

  def handle_chatroom_update_error
    flash[:notice] = { error: ["Failed to update chatroom"] }
    redirect_to edit_chatroom_path(@chatroom)
  end
end
