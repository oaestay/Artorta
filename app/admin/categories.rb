ActiveAdmin.register Category do
 controller do
    include ::RealmBehaviour

    def scoped_collection
      end_of_association_chain.where(realm: current_realm)
    end

    def create
      params[:slug] = I18n.transliterate(params["name"].delete(" ")).underscore
      subcategories = params[:cake].delete([:subcategories_input]).split
      params[:category][:subcategories] = subcategories.map do |subcategory|
        [I18n.transliterate(subcategory.delete(" ")).underscore, subcategory]
      end.to_h
      create!
    end

    def update
      params[:slug] = I18n.transliterate(params["name"].delete(" ")).underscore
      subcategories = params[:cake].delete([:subcategories_input]).split
      params[:category][:subcategories] = subcategories.map do |subcategory|
        [I18n.transliterate(subcategory.delete(" ")).underscore, subcategory]
      end.to_h
      create!
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
      f.input :active, input_html: { checked: true }
      f.input :subcategories_input, as: :tags, label: "Subcategorías"
      f.input :realm, as: :hidden, input_html: { value: current_realm }
    end
    f.actions
  end
end
