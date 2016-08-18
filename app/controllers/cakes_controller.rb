require "i18n"

class CakesController < ApplicationController
  before_action :authenticate_user!, :except => [:catalog, :index, :show, :search, :cakes_tagged_with]
  before_action :set_cake, only: [:show, :edit, :update, :destroy]

  def catalog
    @title = "Catálogo"
    @newest = Cake.last(8)
    @most_popular = Cake.all.order("popularity desc").limit(8)

  end

  def index
    if (params.key? :menu)
      @menu = params[:menu]
      case @menu
      when "decoradas"
        @cakes = Cake.decoradas.order("popularity desc")
        @title = "Tortas decoradas"
        @submenu = MENU_DECORADAS
      when "novios"
        @cakes = Cake.novios.order("popularity desc")
        @title = "Tortas de novios"
        @submenu = MENU_NOVIOS
      when "tradicionales"
        @cakes = Cake.tradicionales.order("popularity desc")
        @title = "Tortas tradicionales"
        @submenu = MENU_TRADICIONALES
      when "cupcakes"
        @cakes = Cake.cupcakes.order("popularity desc")
        @title = "Cupcakes"
        @submenu = MENU_CUPCAKES
      else
        params.delete :menu
        redirect_to catalog_url
      end
    else
      redirect_to catalog_url
    end
    unless @cakes.nil?
      @cakes = @cakes.paginate(page: params[:page], per_page: 24)
    end
  end

  def search
    @title = "Resultados de la búsqueda"
    @category = params[:category]
    @tags = remove_stopwords(params[:search].split())
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
    end
    @cakes = @cakes.paginate(:page => params[:page], :per_page => 24)
  end

  def cakes_tagged_with
    @menu = params[:menu]
    @subcategory = params[:subcategory]
    if (params.key? :menu)
      case @menu
      when "decoradas"
        @cakes = Cake.decoradas.tagged_with(@subcategory).order("name asc")
        @title = "Tortas decoradas"
        @submenu = MENU_DECORADAS
      when "novios"
        @cakes = Cake.novios.tagged_with(@subcategory).order("name asc")
        @title = "Tortas de novios"
        @submenu = MENU_NOVIOS
      when "tradicionales"
        @cakes = Cake.tradicionales.tagged_with(@subcategory).order("name asc")
        @title = "Tortas tradicionales"
        @submenu = MENU_TRADICIONALES
      when "cupcakes"
        @cakes = Cake.cupcakes.tagged_with(@subcategory).order("name asc")
        @title = "Cupcakes"
        @submenu = MENU_CUPCAKES
        params.delete :menu
        redirect_to catalog_url
      end
    else
      redirect_to catalog_url
    end
    unless @cakes.nil?
      @cakes = @cakes.paginate(page: params[:page], per_page: 24)
    end
  end

  def show
    @cake.popularity += 1
    @cake.save
    respond_to do |format|
      format.html # show.html.erb
      format.js # show.js.erb
      format.json { render json: @cake }
  end
  end

  def new
    @cake = Cake.new
  end

  def create
    cp = cake_params
    cp[:tag_list] << cp[:code]
    cp[:tag_list] += cp[:name].split
    cp[:tag_list] = remove_stopwords(cp[:tag_list])
    @cake = Cake.new(cp)
    if @cake.save
      respond_to do |format|
        format.html {redirect_to @cake}
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    @cake.tag_list = []
    @cake.save
    @cake.reload
    cp = cake_params
    cp[:tag_list] << cp[:code]
    cp[:tag_list] += cp[:name].split
    cp[:tag_list] = remove_stopwords(cp[:tag_list])
    respond_to do |format|
      if @cake.update(cp)
        format.html { redirect_to @cake, notice: 'Torta actualizada correctamente' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @cake.destroy
    flash[:notice] = "Torta eliminada correctamente"
    redirect_to cakes_url
  end

  private

  def set_cake
    @cake = Cake.find(params[:id])
  end

  def cake_params
    params.require(:cake)
      .permit(:code, :name, :category, :minimum_portions, :portion_price, :includes_couple, :warranty, :image, prices_attributes: [:id, :portions, :price, :_destroy], tag_list: [])
  end

  def normalize_string(a)
    I18n.transliterate(a).gsub(/[^0-9A-Za-z ]/, '').downcase.strip
  end

  def remove_stopwords(tag_list)
    tag_list.map{ |x| normalize_string(x) }.select{|x| !STOP_WORDS.include?(x)}
  end
end
