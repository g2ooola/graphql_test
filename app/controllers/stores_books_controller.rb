class StoresBooksController < ApplicationController
  before_action :set_stores_book, only: %i[ show edit update destroy ]

  # GET /stores_books or /stores_books.json
  def index
    @stores_books = StoresBook.all
  end

  # GET /stores_books/1 or /stores_books/1.json
  def show
  end

  # GET /stores_books/new
  def new
    @stores_book = StoresBook.new
  end

  # GET /stores_books/1/edit
  def edit
  end

  # POST /stores_books or /stores_books.json
  def create
    @stores_book = StoresBook.new(stores_book_params)

    respond_to do |format|
      if @stores_book.save
        format.html { redirect_to @stores_book, notice: "Stores book was successfully created." }
        format.json { render :show, status: :created, location: @stores_book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stores_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stores_books/1 or /stores_books/1.json
  def update
    respond_to do |format|
      if @stores_book.update(stores_book_params)
        format.html { redirect_to @stores_book, notice: "Stores book was successfully updated." }
        format.json { render :show, status: :ok, location: @stores_book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stores_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores_books/1 or /stores_books/1.json
  def destroy
    @stores_book.destroy
    respond_to do |format|
      format.html { redirect_to stores_books_url, notice: "Stores book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stores_book
      @stores_book = StoresBook.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stores_book_params
      params.fetch(:stores_book, {})
    end
end
