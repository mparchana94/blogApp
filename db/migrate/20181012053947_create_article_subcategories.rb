class CreateArticleSubcategories < ActiveRecord::Migration
  def change
    create_table :article_subcategories do |t|
      t.references :article_id
      t.references :sub_category_id
    end
  end
end
