class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  has_many :comments, as: :commentable
  belongs_to :parent
  has_many :replies,  foreign_key: :parent_id, dependent: :destroy
  validates :comment, presence: true, :length => { maximum: 500 }
end
