class BooksController < ApplicationController
  before_action :authorize

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @check_out = false
  end

  def create
    @book = Book.new(book_params)
    #If book does save redirect to show
    if @book.save
        redirect_to @book
    else
      render :new
    end
  end

  def edit
    @book= Book.find(params[:id])
    @check_out = @book.check_out
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def book_params
    params.require(:book).permit(:title, :check_out)
  end
end
