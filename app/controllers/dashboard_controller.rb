class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def performed
    @transfers = Transfer.where(user_id: current_user.id)
  end

  def received
    @transfers = Transfer.where(receiver_id: current_user.id)
  end

end