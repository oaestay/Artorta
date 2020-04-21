ActiveAdmin.register WeddingTopping do
  permit_params :id, :name, :code, :image

  index do
    selectable_column
    id_column
    column :name
    column :code
    column :popularity
    image_column :image, style: :small
    actions
  end

  show do
    columns do
      column do
        attributes_table do
          row :id
          row :name
          row :code
          row :popularity
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
    f.inputs "Cúpula" do
      f.input :name
      f.input :code
      f.input :popularity
      f.input :image
    end
    f.actions
  end
end
