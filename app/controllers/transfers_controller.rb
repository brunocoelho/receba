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

  # GET /transfers/new
  def new
    @transfer = Transfer.new
  end

  # GET /transfers/1/edit
  def edit
  end

  # POST /transfers
  # POST /transfers.json
  def create
    # pagarme_transaction = PagarMe::Transaction.new(tr)

    @transfer = Transfer.new(transfer_params)

    respond_to do |format|
      if @transfer.save
        format.html { redirect_to @transfer, notice: 'Transfer was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /transfers/1
  # PATCH/PUT /transfers/1.json
  def update
    respond_to do |format|
      if @transfer.update(transfer_params)
        format.html { redirect_to @transfer, notice: 'Transfer was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def find_transfer
    @transfer = Transfer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def transfer_params
    params.require(:transfer).permit(:user_id, :receiver_id, :amount, :email, :name, :card_hash)
  end
end