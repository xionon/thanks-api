class MessagesController < ApplicationController
  def index
    @messages = Message.order(:created_at => :desc).limit(20).all

    respond_to do |format|
      format.html
      format.json { render json: @messages }
    end
  end

  def create
    Message.create!(message_params)

    head :ok
  end

  private
  def message_params
    params.require(:message).permit(:recipient, :body)
  end
end
