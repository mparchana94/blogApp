class SubCategory < ActiveRecord::Base
  belongs_to :category
  belongs_to :article

  validates :name, :presence => true

  def to_s
    name
  end
  
end
