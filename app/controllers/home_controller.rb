class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
  	@books_total = policy_scope(Book).all.count
  	@services_total = policy_scope(Service).all.count
  	@ads_total = policy_scope(Ad).all.count
  	@budgets_total = policy_scope(Budget).all.count
  end
end
