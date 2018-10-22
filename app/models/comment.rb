class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  has_many :comments, as: :commentable
  #validates :comment, presence: true, :length => { maximum: 5000 }
end
