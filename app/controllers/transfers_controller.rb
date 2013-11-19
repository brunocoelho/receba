# require "pagarme"

class TransfersController < ApplicationController
  before_action :find_transfer, only: [:show, :edit, :update]

  # GET /transfers
  # GET /transfers.json
  def index
    @transfers = Transfer.all
  end

  # GET /transfers/1
  # GET /transfers/1.json
  def show
  end

  # POST /transfers
  # POST /transfers.json
  def create
    @transfer = Transfer.new(transfer_params)

    pagarme_transaction = PagarMe::Transaction.new(params[:card_hash])
    pagarme_transaction.amount = @transfer.amount

    begin
      pagarme_transaction.charge
    rescue PagarMe::PagarMeError => e
      puts e.inspect
      redirect_to :back, notice: "Erro: #{e.message}"
      return
    end

    @transfer.transaction_id = pagarme_transaction.id
    @transfer.status = pagarme_transaction.status.to_s

    if @transfer.save
      redirect_to @transfer, notice: 'Pagamento realizado com sucesso!'
    else
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
    params.require(:transfer).permit(:user_id, :receiver_id, :amount, :email, :name, :message, :card_hash)
  end
end