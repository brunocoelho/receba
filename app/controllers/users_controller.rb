class UsersController < ApplicationController

  def show
    @user = User.find_by_username(params[:id])
    @transfer = Transfer.new
  end

  def edit
    @user = User.find_by_username(params[:id])
  end

  def update
    @user = User.find_by_username(params[:id])

    if @user.update(user_params)
      redirect_to @user, notice: 'Dados atualizados'
    else
      render action: 'edit'
    end
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find_by_username(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :location, :username)
  end
end