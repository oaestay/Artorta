ActiveAdmin.register Promo do
  permit_params :image, :category_id, :name, :realm, :priority

  index do
    selectable_column
    id_column
    column :name
    column :category
    column :priority
    image_column :image, style: :small
    actions
  end

  show do
    columns do
      column do
        attributes_table do
          row :id
          row :name
          row :category
          row :priority
          row :created_at
          row :updated_at
        end
      end
      column do
        attributes_table do
          image_row :image, style: :medium
        end
      end
    end
  end


  form do |f|
    f.inputs "Oferta" do
      f.input :name
      f.input :image
      f.input :priority, label: "Prioridad (se ordenan de menor a mayor)"
      f.input :category, as: :select, collection: Category.where(realm: current_realm)
      f.input :realm, as: :hidden, input_html: { value: current_realm }
    end
    f.actions
  end
end
