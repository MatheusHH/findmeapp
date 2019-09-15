class WelcomeController < ApplicationController
  layout 'welcome'
  
  def index
  	if params[:q] && params[:q].reject { |k, v| v.blank? }.present?
  		@q = Ad.ransack(params[:q])
  	else
  		@q = Ad.none.ransack
  	end
  	@ads = @q.result
  	@ads = @ads.near(params[:city]) if params[:city]
  end

  #private

  #	def filter_by_cities
  #		@ads = @ads.select do |a|
  #			a.near(params[:city])
  #		end
  #	end
end
