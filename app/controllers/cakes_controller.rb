require "i18n"

class CakesController < ApplicationController
  before_action :authenticate_user!, :except => [:catalog, :index, :show, :search]
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
        @cakes = Cake.decoradas
        @title = "Tortas decoradas"
      when "novios"
        @cakes = Cake.novios
        @title = "Tortas de novios"
      when "tradicionales"
        @cakes = Cake.tradicionales
        @title = "Tortas tradicionales"
      when "cupcakes"
        @cakes = Cake.cupcakes
        @title = "Cupcakes"
      else
        params.delete :menu
        redirect_to catalog_url
      end
    else
      redirect_to catalog_url
    end
    @cakes = @cakes.paginate(page: params[:page], per_page: 24)
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
