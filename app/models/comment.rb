class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  validates :content, presence: true,
                      length: {
                        maximum: 140,
                        minimum: 1
                      }
end
