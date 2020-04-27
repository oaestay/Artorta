ActiveAdmin.register Category do
  permit_params :id, :name, :slug, :category_id, :priority, :active, :subcategories_input, :realm

  controller do
    include RealmBehaviour
    include TagBehaviour

    def scoped_collection
      end_of_association_chain.where(realm: current_realm)
    end

    def create
      params[:category].delete(:virtual_subcategories_input_attr)
      permitted_params[:category][:slug] = normalize_string(params[:category][:name])
      create!
    end

    def update
      params[:category].delete(:virtual_subcategories_input_attr)
      params[:category][:slug] = normalize_string(params[:category][:name])
      update!
    end
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :subcategories, :active, :realm, :slug
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :subcategories, :active, :realm, :slug]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs "Torta" do
      f.input :name
      f.input :priority, label: "Prioridad (se ordenan de menor a mayor)"
      f.input :active, input_html: { checked: true }
      f.input :subcategories_input, as: :tags, label: "Subcategorías"
      f.input :realm, as: :hidden, input_html: { value: current_realm }
    end
    f.actions
  end
end
