class Campaign < ApplicationRecord
	belongs_to :user

	has_many :campaign_customer, dependent: :destroy
	has_many :customers, through: :campaign_customer

	after_save :schedule_mail



	private

	def schedule_mail
	  @customers = Customer.where(user_id: self.user_id)
	  @customers.each do |customer|
	  	CampaignCustomer.create(campaign: self, customer: customer)
	  	CampaignJob.perform_now(customer, self.title, self.body)
	  end
	end
end
