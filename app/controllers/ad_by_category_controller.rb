class AdByCategoryController < ApplicationController
  layout 'welcome'
  
  def show
  	@category = Category.find(params[:id])
  end

end