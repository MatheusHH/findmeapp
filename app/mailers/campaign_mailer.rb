class CampaignMailer < ApplicationMailer

  def offers(customer, title, body)
  	@body = body
    mail to: customer.address.email, subject: title
  end
end
