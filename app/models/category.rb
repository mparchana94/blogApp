class Category < ActiveRecord::Base
  has_and_belongs_to_many :articles
  has_many :sub_categories, dependent: :destroy
  accepts_nested_attributes_for :sub_categories, reject_if: proc { |attributes| attributes['name'].blank? } 

  validates :name, :presence => true

  def to_s
    name
  end

end
