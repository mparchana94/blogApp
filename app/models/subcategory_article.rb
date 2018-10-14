class SubcategoryArticle < ActiveRecord::Base
  belons_to :sub_category
  belons_to :article
end
