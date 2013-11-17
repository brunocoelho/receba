class HomeController < ApplicationController
  layout "home"

  def index
    redirect_to dashboard_index_url if user_signed_in?
  end

  def about
  end

  def legal
  end

  def privacy
  end

  def security
  end
end