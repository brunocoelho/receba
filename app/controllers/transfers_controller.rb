class TransfersController < ApplicationController
  before_action :find_transfer, only: [:show, :edit, :update]

  def index
    @transfers = Transfer.all
  end

  def show
  end

  def new
    @transfer = Transfer.new
  end

  def create
    @transfer = Transfer.new(transfer_params)
    if @transfer.save
      redirect_to @transfer, notice: 'Pagamento realizado com sucesso!'
    else
      puts @transfer.errors.inspect
      redirect_to @transfer, notice: "Erro: #{e.message}"
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def find_transfer
    @transfer = Transfer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def transfer_params
    params.require(:transfer).permit(:user_id, :receiver_id, :amount, :email, :name, :message)
  end
end