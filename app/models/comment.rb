class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  #validates :comment, presence: true, :length => { maximum: 5000 }
end
