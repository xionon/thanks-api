class MessagesController < ApplicationController
  def index
    @messages = Message.order(:created_at => :desc).limit(20).all

    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    warden.authenticate!

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
