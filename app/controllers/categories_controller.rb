class CategoriesController < ApplicationController
  before_action :admin_user, only: [:index, :create]

  def index
    @categories = Category.all
  end

  def create
    new_category = Category.new(new_category_params)
    if new_category.save
      flash.now[:success] = "#{new_category.name} added to categories"
    elsif new_category.name.strip.empty?
      flash.now[:danger] = "Cannot add a blank category"
    else
      flash.now[:danger] = "Unable to add #{new_category.name}. Does it already exist?"
    end
    @categories = Category.all
    render 'index'
  end

  private

  def new_category_params
    params.require(:new_category).permit(:name)
  end

end
