ActiveAdmin.register Cake do
  permit_params :id, :name, :code, :category_id, :minimum_portions, :portion_price, :includes_couple,
    :warranty, :image, :description, :popularity, :realm,
    :tag_list, prices_attributes: [:id, :portions, :price, :_destroy]

  filter :name
  filter :code
  filter :description
  filter :category
  filter :includes_couple
  filter :minimum_portions
  filter :popularity
  filter :portion_price
  filter :warranty

  controller do
    include TagBehaviour

    def scoped_collection
      end_of_association_chain.where(realm: current_realm)
    end

    def create
      params[:cake].delete(:virtual_tag_list_attr)
      params[:cake][:tag_list] = params[:cake][:tag_list].split.map { |tag| normalize_string(tag) }
      params[:cake][:tag_list] += params[:cake][:code].split.map { |tag| normalize_string(tag) }
      params[:cake][:tag_list] += params[:cake][:name].split.map { |tag| normalize_string(tag) }
      params[:cake][:tag_list] = remove_stopwords(params[:cake][:tag_list]).join(", ")
      create!
    end

    def update
      params[:cake].delete(:virtual_tag_list_attr)
      params[:cake][:tag_list] = params[:cake][:tag_list].split.map { |tag| normalize_string(tag) }
      params[:cake][:tag_list] += params[:cake][:code].split.map { |tag| normalize_string(tag) }
      params[:cake][:tag_list] += params[:cake][:name].split.map { |tag| normalize_string(tag) }
      params[:cake][:tag_list] = remove_stopwords(params[:cake][:tag_list]).join(", ")
      update!
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :code
    column :category
    actions
  end

  show do
    columns do
      column do
        attributes_table do
          row :id
          row :name
          row :code
          row :description
          row :category
          row :includes_couple
          row :minimum_portions
          row :popularity
          row :portion_price
          row :warranty
          row :created_at
          row :updated_at
        end
      end
      column do
        attributes_table do
          image_row :image, style: :large
          list_row :tag_list
        end
      end
    end

    panel "Precios" do
      table_for resource.prices do
        column(:portions)
        column(:price) { |price| "$ #{price.price}" }
      end
    end
  end

  form do |f|
    f.inputs "Torta" do
      f.input :name
      f.input :code
      f.input :category, as: :select, collection: Category.where(realm: current_realm)
      f.input :description
      f.input :image
      f.input :tag_list, as: :tags, label: 'Tags'
      f.input :realm, as: :hidden, input_html: { value: current_realm }
    end

    f.inputs do
      f.has_many :prices, heading: 'Precios',
                          allow_destroy: true do |ff|
        ff.input :portions
        ff.input :price
      end
    end
    f.actions
  end
end
