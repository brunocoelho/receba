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
    payer = MyMoip::Payer.new(
      id:                    transfer_params[:receiver_id],
      name:                  transfer_params[:name],
      email:                 transfer_params[:email]
    )

    credit_card = MyMoip::CreditCard.new(
      logo:                     'visa',
      card_number:              '4916654211627608',
      expiration_date:          '06/15',
      security_code:            '000',
      owner_name:               'Juquinha da Rocha',
      owner_birthday:           '03/11/1984',
      owner_phone:              '5130405060',
      owner_cpf:                '52211670695',
    )

    # Percentage value
    commissions = MyMoip::Commission.new(
      reason: 'Shipping',
      receiver_login: 'commissioned_moip_login',
      percentage_value: 0.01
    )

    instruction = MyMoip::Instruction.new(
      id:             'instruction_id_defined_by_you',
      payment_reason: 'Order in Buy Everything Store',
      values:         [100.0],
      commissions:    commissions,
      payer:          payer
    )

    credit_card = MyMoip::CreditCard.new(
      logo:                     'visa',
      card_number:              '4916654211627608',
      expiration_date:          '06/15',
      security_code:            '000',
      owner_name:               'Juquinha da Rocha',
      owner_birthday:           '03/11/1984',
      owner_phone:              '5130405060',
      owner_cpf:                '52211670695',
    )

    transparent_request = MyMoip::TransparentRequest.new('your_logging_id')
    transparent_request.api_call(instruction)

    credit_card_payment = MyMoip::CreditCardPayment.new(credit_card, installments: 1)
    payment_request     = MyMoip::PaymentRequest.new('your_logging_id')
    payment_request.api_call(credit_card_payment, token: transparent_request.token)

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