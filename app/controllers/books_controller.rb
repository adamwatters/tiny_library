class BooksController < ApplicationController

  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @books = Book.paginate(page:params[:page])
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash.now[:success] = "#{@book.title} successfully added"
      redirect_to @book
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @book.update_attributes(book_params)
      flash[:success] = "#{@book.title} successfully updated"
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    book_to_destroy = Book.find(params[:id])
    flash[:success] = "#{book_to_destroy.title} deleted"
    book_to_destroy.destroy
    redirect_to books_url
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :number, :categories)
  end

end
