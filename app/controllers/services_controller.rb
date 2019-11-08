class ServicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  # GET /services
  # GET /services.json
  def index
    if params[:q]
      @q = policy_scope(Service).all.ransack(params[:q])
      @services = @q.result.page(params[:page]).per(5)
    else
      @q = Service.none.ransack
      @services = policy_scope(Service).all.page(params[:page]).per(5)
    end
  end

  # GET /services/1
  # GET /services/1.json
  def show
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
    authorize @service
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)
    @service.user = current_user
    respond_to do |format|
      if @service.save
        format.html { redirect_to services_url, notice: t('flash.actions.create.notice', model: @service.model_name.human) }
        format.json { render :show, status: :created, location: @service }
        format.js {}
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to services_url, notice: t('flash.actions.update.notice', model: @service.model_name.human) }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    authorize @service
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: t('flash.actions.destroy.notice') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:name, :description, :price)
    end
end
