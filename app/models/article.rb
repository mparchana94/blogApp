class Article < ActiveRecord::Base
  has_and_belongs_to_many :sub_categories
  belongs_to :user
  has_many :comments, as: :commentable
  accepts_nested_attributes_for :comments
  validates :title, presence: true, length: {maximum: 512}
  validates :content, presence: true, length: {maximum: 2048}

  def self.article_search(search, page)
    Article.where('title LIKE ? ', search).paginate(page: page, per_page: 3)
  end

end
