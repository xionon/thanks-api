class SessionsController < ApplicationController
  def new
    flash.now.alert = warden.message if warden.message.present?

    respond_to do |format|
      format.html
      format.json { render :nothing => true, :status => :unauthorized }
    end
  end

  def create
    warden.authenticate!
    redirect_to root_url, notice: "Logged in!"
  end

  def destroy
    warden.logout
    redirect_to root_path
  end
end
