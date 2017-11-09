class PurchaseMailer < ApplicationMailer

  def mail_purchase_notification(client_email, dev_email, message)
    @client_email = client_email
    @message = message
    @shop_email = dev_email
    mail(to: @shop_email, subject: "Customer @ #{@client_email} just made a purchase!")
  end

  def mail_purchase_confirmation(client_email, message)
    @client_email = client_email
    @message = message
    mail(to: @client_email, subject: "Your Commission at Develoo was successful")
  end

end
