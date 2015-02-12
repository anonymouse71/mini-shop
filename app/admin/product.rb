ActiveAdmin.register Product do

  menu false

  ####<$ Scope List $>####
  scope :all, :default => true

  scope :available do |products|
    products.where('stock > ?', 0)
  end

  scope :published do |products|
    products.where('is_published  =?', true)
  end

  ####<$ Strong Parameter $>####
  permit_params :name, :product_code ,:sub_category_id, :description, :short_description, :price, :stock, :is_published,
                :main_image_id, :suppliers, :is_deleted


  index do
    selectable_column
    column do |product|
      image_tag(product.product_photos.first.image_url(:thumb_small)) if product.product_photos.present?
    end
    column auto_link :name
    column :sub_category
    column :price
    column :stock
    column :is_published
    column :created_at
    actions
  end


  show do
    attributes_table do
      row :name
      row :sub_category
      row :description
      row :short_description
      row :short_description
      row :price
      row :stock
      row :is_published
      row :suppliers
      row 'Photo' do |product|
        image_tag(product.product_photos.first.image.list) if product.product_photos.present?
      end
    end
  end

  # Product Form
  form do |f|
    f.inputs do
      f.input :name
      f.input :product_code
      f.input :sub_category
      #f.input :description, as: :ckeditor, input_html: { palceholder: 'Content' }
      f.input :description, input_html: { palceholder: 'Content' }
      f.input :short_description
      f.input :price
      f.input :stock
      f.input :is_published
      f.input :main_image_id
      f.input :suppliers
      f.input :is_deleted
      f.actions
    end
  end

  sidebar :product_stats, :only => :show do
    attributes_table_for resource do
      row('Total Sold')  { Order.find_with_product(resource).count }
      row('Value'){ to_bdt Order.find_with_product(resource).sum(:order_total) }
    end
  end

  sidebar :recent_orders, :only => :show do
    Order.find_with_product(resource).limit(5).collect do |order|
      auto_link(order)
    end.join(content_tag('br')).html_safe
  end

  ####<$ filter options $>####
  filter :name, as: :string
  filter :sub_category
  filter :is_published, as: :radio

end
