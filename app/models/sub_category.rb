class SubCategory < ActiveRecord::Base
  belongs_to :category

  validates :name, :presence => true

  def to_s
    name
  end
  
end
