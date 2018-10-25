class User < ActiveRecord::Base
  mount_uploader :user_image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles
  #has_many :comments 
  has_many :comments, as: :commentable 

end
