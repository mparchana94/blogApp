class CreateSubcategoryArticles < ActiveRecord::Migration
  def change
    create_table :articles_sub_categories do |t|
      t.references :sub_category
      t.references :article
     
    end
  end
end
