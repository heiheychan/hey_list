class CategoriesController < ApplicationController
  # Generate all Sub_categories and pass
  # them to view
  def get_subcategories
    @subcategories = Category.find(params[:category_id]).sub_categories
  end
end
