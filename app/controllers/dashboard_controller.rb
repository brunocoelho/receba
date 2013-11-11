class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    @transfers_performed = Transfer.performed(current_user)
    @transfers_received = Transfer.received(current_user)
  end
end