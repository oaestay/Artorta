require "i18n"

class CakesController < ApplicationController
  def catalog
    @title = "Catálogo"
    @newest = Cake.last(8)
    @most_popular = Cake.all.order(popularity: :desc).limit(8)
  end

  def index
    if (params.key? :menu)
      @menu = params[:menu]
      case @menu
      when "decoradas"
        @cakes = Cake.decoradas
        @title = "Tortas decoradas"
        @submenu = MENU_DECORADAS
      when "novios"
        @cakes = Cake.novios
        @title = "Tortas de novios"
        @submenu = MENU_NOVIOS
      when "tradicionales"
        @cakes = Cake.tradicionales
        @title = "Tortas tradicionales"
        @submenu = MENU_TRADICIONALES
      when "cupcakes"
        @cakes = Cake.cupcakes
        @title = "Cupcakes"
        @submenu = MENU_CUPCAKES
      when "coctel"
        @cakes = Cake.coctel
        @title = "Cóctel"
        @submenu = MENU_COCTEL
      when "postres"
        @cakes = Cake.postres
        @title = "Postres"
        @submenu = MENU_POSTRES
      when "pies"
        @cakes = Cake.pies
        @title = "Pies y Brazos"
        @submenu = MENU_PIES
      when "chocolateria"
        @cakes = Cake.chocolateria
        @title = "Chocolatería"
        @submenu = MENU_CHOCOLATERIA
      when "galletones"
        @cakes = Cake.galletones
        @title = "Galletones"
        @submenu = MENU_GALLETONES
      else
        params.delete :menu
        redirect_to catalog_url
      end
    else
      redirect_to catalog_url
    end
    unless @cakes.nil?
      @cakes = if @menu == "novios"
                 @cakes.order("code asc, popularity desc, created_at desc")
               else
                 @cakes.order("popularity desc, created_at desc")
               end
      @cakes = @cakes.paginate(page: params[:page], per_page: 24)
    end
  end

  def search
    @title = "Resultados de la búsqueda"
    @category = params[:category]
    @tags = remove_stopwords(params[:tag_list].split())
    case @category
    when "all"
      @cakes = Cake.tagged_with(@tags, :any => true)
    when "decoradas"
      @cakes = Cake.decoradas.tagged_with(@tags, :any => true)
    when "novios"
      @cakes = Cake.novios.tagged_with(@tags, :any => true)
    when "tradicionales"
      @cakes = Cake.tradicionales.tagged_with(@tags, :any => true)
    when "cupcakes"
      @cakes = Cake.cupcakes.tagged_with(@tags, :any => true)
    when "coctel"
      @cakes = Cake.coctel.tagged_with(@tags, :any => true)
    when "postres"
      @cakes = Cake.postres.tagged_with(@tags, :any => true)
    when "pies"
      @cakes = Cake.pies.tagged_with(@tags, :any => true)
    when "chocolateria"
      @cakes = Cake.chocolateria.tagged_with(@tags, :any => true)
    when "galletones"
      @cakes = Cake.galletones.tagged_with(@tags, :any => true)
    end
    @cakes = @cakes.sort_by { |o| -(@tags & o.tag_list).length }.paginate(:page => params[:page], :per_page => 24)
  end

  def cakes_tagged_with
    @menu = params[:menu]
    @subcategory = params[:subcategory]
    if (params.key? :menu)
      case @menu
      when "decoradas"
        @cakes = Cake.decoradas
        @title = MENU_DECORADAS[@subcategory]
        @submenu = MENU_DECORADAS
      when "novios"
        @cakes = Cake.novios
        @title = MENU_NOVIOS[@subcategory]
        @submenu = MENU_NOVIOS
      when "tradicionales"
        @cakes = Cake.tradicionales
        @title = MENU_TRADICIONALES[@subcategory]
        @submenu = MENU_TRADICIONALES
      when "cupcakes"
        @cakes = Cake.cupcakes
        @title = MENU_CUPCAKES[@subcategory]
        @submenu = MENU_CUPCAKES
      when "coctel"
        @cakes = Cake.coctel
        @title = MENU_COCTEL[@subcategory]
        @submenu = MENU_COCTEL
      else
        params.delete :menu
        redirect_to catalog_url
      end
    else
      redirect_to catalog_url
    end
    unless @cakes.nil?
      @cakes = if @menu == "novios"
                 @cakes.tagged_with(@subcategory).order("code asc, name asc, popularity desc, created_at desc")
               else
                 @cakes.tagged_with(@subcategory).order("name asc, popularity desc, created_at desc")
               end
      @cakes = @cakes.paginate(page: params[:page], per_page: 24)
    end
  end

  private

  def cake_params
    params.require(:cake).permit(
      :code, :name, :description, :category, :minimum_portions, :portion_price, :includes_couple,
      :warranty, :image, :popularity,
      prices_attributes: [:id, :portions, :price, :_destroy], tag_list: []
    )
  end

  def normalize_string(a)
    I18n.transliterate(a).gsub(/[^0-9A-Za-z_ ]/, '').downcase.strip
  end

  def remove_stopwords(tag_list)
    tag_list.map{ |x| normalize_string(x) }.select{|x| !STOP_WORDS.include?(x)}
  end
end
