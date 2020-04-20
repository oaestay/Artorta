require "i18n"

class CakesController < ApplicationController
  include TagBehaviour

  def catalog
    @title = "Catálogo"
    @newest = Cake.last(8)
    @most_popular = Cake.all.order(popularity: :desc).limit(8)
  end

  def index
    @category = Category.find_by(slug: params[:category])
    if @category.blank?
      params.delete :category
      return redirect_to catalog_url
    end

    @title = @category.name
    @cakes = @category.cakes

    @subcategory = params[:subcategory]
    if @subcategory.present?
      @cakes = @cakes.tagged_with(@subcategory)
      @title = @category.subcategories[@subcategory.to_sym]
    end

    if @category.slug == "novios"
     @cakes = @cakes.order(code: :asc, popularity: :desc, created_at: :desc)
    else
      @cakes = @cakes.order(popularity: :desc, created_at: :desc)
    end
    @cakes = @cakes.paginate(page: params[:page], per_page: 24)
  end

  def search
    @category = Category.find_by(slug: params[:category])
    @cakes = @category&.cakes || Cake.all
    tags = remove_stopwords(params[:tag_list].split.map { |tag| normalize_string(tag) })
    @cakes = @cakes.tagged_with(tags, :any => true).sort_by { |o| -(tags & o.tag_list).length }
    @cakes = @cakes.paginate(:page => params[:page], :per_page => 24)
  end
end
