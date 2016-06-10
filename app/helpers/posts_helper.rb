module PostsHelper
  def preselect_category(post)
    if post.category == nil
      { prompt: "Choose a category" }
    else
      {:selected => Category.find_by_name(@post.category).id}
    end
  end
end
