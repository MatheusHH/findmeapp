class WelcomeController < ApplicationController
  layout 'welcome'
  
  before_action :load_category, only: [:index]
  after_action :load_coords_to_session, only: [:index]
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

  private
    def load_category
      @categories = Category.all
    end

    def load_coords_to_session
      session[:latitude] = @latitude
      session[:longitude] = @longitude
    end
end
