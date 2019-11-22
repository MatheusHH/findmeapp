class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
  	@books_total = current_user.counter_of_books
  	@services_total = current_user.counter_of_services
  	@ads_total = current_user.counter_of_ads
  	@budgets_total = current_user.counter_of_budgets
  	@customers = current_user.customers_count
  	@campaigns = current_user.counter_of_campaigns
  end
end
