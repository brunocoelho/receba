class Notifications < ActionMailer::Base
  default from: "contato@receba.la"

  # Sent to the User right after Sign Up
  # Parameter is a User object
  def signed_up(user)
    @user = user
    email_with_name = "#{@user.name} <#{@user.email}>"

    mail(
      to: email_with_name,
      subject: 'Bem-vindo ao Receba.la'
    )
  end

  # Sent to the User after he has performed a successfull Transfer
  # Parameter is a Transfer object
  def transfer_performed_success(transfer)
  end

  # Sent to the User after he has received a successfull Transfer
  # Parameter is a Transfer object
  def transfer_received_success(transfer)
  end

  # Sent to the User after a Transfer of his has failed
  # Parameter is a Transfer object
  def transfer_fail(transfer)
  end

  # Sent to a collection of email addresses that we fetch after the FB Authentication
  # Parameter is an Array of Strings, each representing an email addres
  def email_friends(friends_list)
  end
end