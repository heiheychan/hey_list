class Comment < ActiveRecord::Base
  belongs_to :post
  validates :content, presence: true,
                      length: {
                        maximum: 140,
                        minimum: 1
                      }
end
