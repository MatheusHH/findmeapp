class ChartController < ApplicationController
  before_action :authenticate_user!

  def index
  	@budgets = policy_scope(Budget).joins(:customer).references(:customers)
  	@services = policy_scope(Service).joins(:budget_services, :budgets).references(:budget_services, :budgets)
  	@budgets_total = policy_scope(Budget).all
  end
end
