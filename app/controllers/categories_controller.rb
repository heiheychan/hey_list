class CategoriesController < ApplicationController

  # Generate All Sub_categories
  def get_subcategories
    puts "Successfully enter the controller"
    @subcategories = Category.find(params[:category_id]).sub_categories
  end
end
