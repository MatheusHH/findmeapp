class WelcomeController < ApplicationController
  layout 'welcome'
  
  def index
  	if params[:q] && params[:q].reject { |k, v| v.blank? }.present?
  		@q = Ad.ransack(params[:q])
  	else
  		@q = Ad.none.search
  	end
  	@ads = @q.result
  end
end
