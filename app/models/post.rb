class Post < ActiveRecord::Base
  serialize :images, Array
  has_many :comments
  belongs_to :user
  validates :title, presence: true, 
                    length: {
                      maximum: 140,
                      minimum: 1
                    }
  validates :category, presence: true
  validates :price, numericality: {
                      :greater_than_or_equal_to => 0
                    }

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  mount_uploaders :images, PhotoUploader
end
