class ArticleCategory < ActiveRecord::Base
  belongs_to :article, dependent: :destroy
  belongs_to :category, dependent: :destroy

end
