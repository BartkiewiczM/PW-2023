class HomeController < ApplicationController
  def login
    redirect_to user_google_oauth2_omniauth_authorize_path
  end

  def index
  end
end
