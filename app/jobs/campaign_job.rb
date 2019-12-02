class CampaignJob < ApplicationJob
  queue_as :emails

  def perform(customer, title, body)
    CampaignMailer.offers(customer, title, body).deliver_now
  end
end
