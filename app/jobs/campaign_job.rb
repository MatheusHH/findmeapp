class CampaignJob < ApplicationJob
  queue_as :default

  def perform(customer, title, body)
    CampaignMailer.offers(customer, title, body).deliver_now
  end
end
