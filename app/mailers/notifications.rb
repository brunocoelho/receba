class Notifications < ActionMailer::Base
  default from: "contato@receba.la"

  def signed_up(user)
  end

  def transfer_success(transfer)
  end

  def transfer_fail(transfer)
  end

  def email_friends(user)
  end
end