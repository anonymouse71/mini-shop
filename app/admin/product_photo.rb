ActiveAdmin.register ProductPhoto do

  menu false

  ####<$ Strong Parameter $>####
  permit_params :image, :product_id



  index do
    selectable_column
    column :image do |product_photo|
      image_tag(product_photo.image_url(:thumb_small))
    end
    column :product
    actions

  end

  show do |product_photo|
    attributes_table do
      row :image do
        image_tag(product_photo.image_url(:thumb_small))
      end
      row :product
    end
  end

  # Form for Product Photo
  form(html: { multipart: true }) do |f|
    f.inputs "Product Photo" do
      f.input :product
      f.input :image, as: :file
      f.actions
    end
  end

  ####<$ Filter $>####
  filter :product

end
