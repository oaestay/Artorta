ActiveAdmin.register Press do
  permit_params :id, :name, :image

  index do
    id_column
    column :name
    image_column :image, style: :small
    actions
  end

  show do
    columns do
      column do
        attributes_table do
          row :id
          row :name
          row :created_at
          row :updated_at
        end
      end
      column do
        attributes_table do
          image_row :image, style: :large
        end
      end
    end
  end


  form do |f|
    f.inputs "Prensa" do
      f.input :name
      f.input :image
    end
    f.actions
  end
end
