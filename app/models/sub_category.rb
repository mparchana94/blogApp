class SubCategory < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :articles
  validates :name, :presence => true  
end
