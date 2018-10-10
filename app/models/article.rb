class Article < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :categories, through: :sub_categories
  validates :title, :presence => true
  validates :content, :length => { :maximum => 2048 }
end
