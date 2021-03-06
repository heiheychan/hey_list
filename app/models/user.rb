class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, password_length: 8..50
  validates :username, presence: true, length: {
                                        minimum: 1,
                                        maximum: 20
                                        }

  has_many :posts
  has_many :comments
end
