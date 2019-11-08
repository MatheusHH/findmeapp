class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    if params[:q]
      @q = policy_scope(Customer).all.ransack(params[:q])
      @customers = @q.result.page(params[:page]).per(5)
    else
      @q = Customer.none.ransack
      @customers = policy_scope(Customer).all.page(params[:page]).per(5)
    end
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
    @customer.build_address
  end

  # GET /customers/1/edit
  def edit
    authorize @customer
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)
    @customer.user = current_user
    respond_to do |format|
      if @customer.save
        format.html { redirect_to customers_url, notice: t('flash.actions.create.notice', model: @customer.model_name.human) }
        format.json { render :show, status: :created, location: @customer }
        format.js {}
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to customers_url, notice: t('flash.actions.update.notice', model: @customer.model_name.human) }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    authorize @customer
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: t('flash.actions.destroy.notice') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name, :cpf, :user_id, 
        phones_attributes: [:id, :number, :_destroy],
        address_attributes: [:id, :cep, :neighborhood, :street, :city, :state, :email, :_destroy])
    end
end
