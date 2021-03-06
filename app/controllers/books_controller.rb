class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :set_models_to_modal, only: [:show, :edit, :update, :new, :create]

  # GET /books
  # GET /books.json
  def index
    if params[:initialdate] && params[:finaldate] != ""
      @books = policy_scope(Book).all.search_by_date(params[:initialdate], params[:finaldate]).page(params[:page]).per(5)
    else
      @books = policy_scope(Book).all.page(params[:page]).per(5)
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    authorize @book
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    @book.user = current_user
    respond_to do |format|
      if @book.save
        format.html { redirect_to books_url, notice: t('flash.actions.create.notice', model: @book.model_name.human) }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to books_url, notice: t('flash.actions.update.notice', model: @book.model_name.human) }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    authorize @book
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: t('flash.actions.destroy.notice') } 
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    def set_models_to_modal
      @customer = Customer.new
      @customer.build_address
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:description, :status, :schedule, :user_id, :customer_id)
    end
end
