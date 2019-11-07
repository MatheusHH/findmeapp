class ChartController < ApplicationController
  before_action :authenticate_user!

  def index
  	@budgets = policy_scope(Budget).joins(:customer).references(:customers)
  	@books = policy_scope(Book).all
  	@budgets_total = policy_scope(Budget).all
  end
end
