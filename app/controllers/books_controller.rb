class BooksController < ApplicationController

  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:checkout, :checkin]

  def index
    if params[:search]
      @books = Book.search(params[:search]).order("number ASC")
    else
      @books = Book.paginate(page:params[:page]).order("number ASC")
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @categories = Category.all
  end

  def create
    @book = Book.new(fix_categories(book_params, Category.all))
    if @book.save
      flash.now[:success] = "#{@book.title} successfully added"
      redirect_to @book
    else
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
    @categories = Category.all
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(fix_categories(book_params, Category.all))
      flash[:success] = "#{@book.title} successfully updated"
      redirect_to @book
    else
      render 'edit'
    end
  end

  def checkout
    @book = Book.find(params[:id])
    if @book.update_attributes(checkout_params)
      flash[:success] = "you checked out #{@book.title}!"
      redirect_to @book
    else
      render @book
    end
  end

  def checkin
    @book = Book.find(params[:id])
    if @book.update_attributes({:available => true, :checked_out_by => ""})
      flash[:success] = "Thanks for checking #{@book.title} back in!"
      redirect_to @book
    else
      render @book
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
    params.require(:book).permit(:title, :author, :number, categories: [])
  end

  def fix_categories(params, all_categories)
    if params[:categories]
      params[:categories] = params[:categories].drop(1)
    end
    params
  end

  def checkout_params
    params.require(:book).permit(:checked_out_by).merge({:available => false})
  end

end
