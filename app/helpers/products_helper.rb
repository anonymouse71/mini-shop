module ProductsHelper

  def find_products_of_any_category(category)
    return category.sub_categories.collect{|x| x.products}.flatten
  end

  def find_subcategory_of_any_category(category)
    return category.sub_categories
  end

  def find_products_of_any_sub_category(subCategory)
    return subCategory.products
  end

  def subcat_to_category(subCat)
    Category.find((SubCategory.find_by_name(subCat)).category_id)
  end
end
