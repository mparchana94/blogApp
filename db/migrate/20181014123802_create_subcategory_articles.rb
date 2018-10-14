class CreateSubcategoryArticles < ActiveRecord::Migration
  def change
    create_table :subcategory_articles do |t|
      t.references :sub_category
      t.references :article
     
    end
  end
end
