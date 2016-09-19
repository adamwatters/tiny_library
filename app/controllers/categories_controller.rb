class CategoriesController < ApplicationController
  before_action :admin_user, only: [:index, :create]

  def index
    @categories = Category.all
  end

  def create
    saved_category_names = []
    unsaved_category_names = []
    new_categories_params.each do |key, category_name|
      new_category = Category.new(:name => category_name);
      if new_category.save
        saved_category_names << category_name
      else
        unless category_name.empty?
          unsaved_category_names << category_name
        end
      end
    end
    unless saved_category_names.empty?
      flash.now[:success] = "#{saved_category_names} added to categories"
    end
    unless unsaved_category_names.empty?
      flash.now[:danger] = "#{unsaved_category_names} not added. Do they already exist?"
    end
    @categories = Category.all
    render 'index'
  end

  private

  def new_categories_params
    params.require(:new_categories).permit(:first_new_category, :second_new_category, :third_new_category,
                                           :fourth_new_category, :fifth_new_category)
  end

end
