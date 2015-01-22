class MessagesController < ApplicationController
  before_filter :authenticate_user

  def index
    @messages = Message.order(:created_at => :desc).limit(20).all

    if stale? last_modified: @messages.minimum(:updated_at)
      respond_to do |format|
        format.html
        format.json
      end
    end
  end

  def create
    @message = Message.create!(message_params)

    respond_to do |format|
      format.html { redirect_to messages_path }
      format.json { head :ok }
    end
  end

  private

  def message_params
    params.require(:message).permit(:recipient, :body)
  end
end
