class AdsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ad, only: [:show, :edit, :update, :destroy]

  # GET /ads
  # GET /ads.json
  def index
    if params[:q]
      @q = policy_scope(Ad).all.ransack(params[:q])
      @ads = @q.result.page(params[:page]).per(5)
    else
      @q = Ad.none.ransack
      @ads = policy_scope(Ad).all.page(params[:page]).per(5)
    end
  end

  # GET /ads/1
  # GET /ads/1.json
  def show
  end

  # GET /ads/new
  def new
    @ad = Ad.new
  end

  # GET /ads/1/edit
  def edit
    authorize @ad
  end

  # POST /ads
  # POST /ads.json
  def create
    @ad = Ad.new(ad_params)
    @ad.user = current_user
    @ad.picture.attach(params[:ad][:picture])
    respond_to do |format|
      if @ad.save
        format.html { redirect_to ads_url, notice: t('flash.actions.create.notice', model: @ad.model_name.human) }
        format.json { render :show, status: :created, location: @ad }
      else
        format.html { render :new }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ads/1
  # PATCH/PUT /ads/1.json
  def update
    respond_to do |format|
      if @ad.update(ad_params)
        format.html { redirect_to ads_url, notice: t('flash.actions.update.notice', model: @ad.model_name.human) }
        format.json { render :show, status: :ok, location: @ad }
      else
        format.html { render :edit }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ads/1
  # DELETE /ads/1.json
  def destroy
    authorize @ad
    @ad.destroy
    respond_to do |format|
      format.html { redirect_to ads_url, notice: t('flash.actions.destroy.notice') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad
      @ad = Ad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_params
      params.require(:ad).permit(:title, :picture, :category_id, :street, :city, :state, :country, :contact, :latitude, :longitude, :description, :user_id)
    end
end
