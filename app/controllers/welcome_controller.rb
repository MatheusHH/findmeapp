class WelcomeController < ApplicationController
  layout 'welcome'
  
  before_action :load_category, only: [:index]

  def index
  	session[:latitude] = params[:latitude].to_f
  	session[:longitude] = params[:longitude].to_f
  	if params[:q] && params[:q].reject { |k, v| v.blank? }.present?
  		@q = Ad.ransack(params[:q])
  	else
  		@q = Ad.none.ransack
  	end
  	@ads = @q.result.page(params[:page]).per(3)
  	@ads = @ads.near(params[:city]) if params[:city]
  	@ads = @ads.near([session[:latitude], session[:longitude]], 50).page(params[:page]).per(3) if params[:latitude].to_f != 0 && params[:longitude].to_f != 0
  end

  private
    def load_category
      @categories = Category.all
    end
end
