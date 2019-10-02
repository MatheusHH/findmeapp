class WelcomeController < ApplicationController
  layout 'welcome'
  
  def index
  	@latitude = params[:latitude].to_f
  	@longitude = params[:longitude].to_f
  	if params[:q] && params[:q].reject { |k, v| v.blank? }.present?
  		@q = Ad.ransack(params[:q])
  	else
  		@q = Ad.none.ransack
  	end
  	@ads = @q.result.page(params[:page]).per(4)
  	@ads = @ads.near(params[:city]) if params[:city]
  	@ads = @ads.near([@latitude, @longitude], 50).page(params[:page]).per(4) if params[:latitude].to_f != 0 && params[:longitude].to_f != 0
  end


  #private

  #	def filter_by_cities
  #		@ads = @ads.select do |a|
  #			a.near(params[:city])
  #		end
  #	end
end
