module PostsHelper
  # Distingush the difference of Category 
  # select between edit and create page
  def preselect_category(post)
    puts post.category
    if post.category == nil || post.category.empty?
      { prompt: t("share.create_post.helper") }
    else
      {:selected => Category.find_by_name(@post.category).id}
    end
  end
  # Get label for display
  def get_label(sub_cat)
    case sub_cat
    when "Travel Buddy"
      return "primary"
    when "Roommate"
      return "success" 
    when "Furniture"
      return "info"
    when "Book"
      return "warning"
    when "Study Buddy"
      return "danger" 
    when "Electronics"
      return "primary" 
    when "Car"
      return "success" 
    when "Sublease"
      return "info"
    when "Apparel"
      return "warning"  
    end
  end
end
