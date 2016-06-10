class CategoriesController < ApplicationController

  # Generate All Sub_categories
  def get_subcategories
    puts "Successfully enter the controller"
    @subcategories = Category.find(params[:category_id]).sub_categories
    @subcategories.each do |sc|
      puts sc.name
    end
  end
end
