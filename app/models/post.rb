class Post < ActiveRecord::Base
  validates :title, presence: true, 
                    length: {
                      maximum: 100,
                      minimum: 5
                    }
  validates :category, presence: true
  validates :price, numericality: {
                      :greater_than_or_equal_to => 0
                    }


end
