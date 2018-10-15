class Article < ActiveRecord::Base
has_and_belongs_to_many :sub_categories
belongs_to :user
has_many :comments
validates :title, presence: true
validates :content, presence: true, length: {maximum: 2048}
end
