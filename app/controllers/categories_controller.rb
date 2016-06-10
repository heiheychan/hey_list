class CategoriesController < ApplicationController
  # Generate all Sub_categories and pass
  # them to view
  def get_subcategories
    puts "Successfully enter the controller"
    @subcategories = Category.find(params[:category_id]).sub_categories
  end
end
