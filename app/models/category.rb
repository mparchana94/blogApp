class Category < ActiveRecord::Base
  has_and_belongs_to_many :articles
  has_many :sub_categories, dependent: :destroy
  has_many :articles, through: :sub_categories
  accepts_nested_attributes_for :sub_categories, reject_if: proc { |attributes| attributes['name'].blank? }, allow_destroy: true
  validates :name, :presence => true

end
