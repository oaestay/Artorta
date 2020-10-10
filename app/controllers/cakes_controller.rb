require "i18n"

class CakesController < ApplicationController
  include TagBehaviour

  def catalog
    @title = "Catálogo"
    if use_scoped_resources?
      @newest = Cake.where(realm: current_realm).last(8)
      @most_popular = Cake.where(realm: current_realm).order(popularity: :desc).limit(8)
    else
      @newest = Cake.last(8)
      @most_popular = Cake.all.order(popularity: :desc).limit(8)
    end
  end

  def index
    @category = if use_scoped_resources?
                  Category.where(realm: current_realm).find_by(slug: params[:category])
                else
                  Category.find_by(slug: params[:category])
                end
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

    if @category.slug == "tortas_de_novios"
     @cakes = @cakes.order(code: :asc, popularity: :desc, created_at: :desc)
    else
      @cakes = @cakes.order(popularity: :desc, created_at: :desc)
    end
    @cakes = @cakes.paginate(page: params[:page], per_page: 24)
  end

  def search
    @category = if use_scoped_resources?
                  Category.where(realm: current_realm).find_by(slug: params[:category])
                else
                  Category.find_by(slug: params[:category])
                end
    if use_scoped_resources?
      @cakes = @category&.cakes || Cake.where(realm: current_realm)
    else
      @cakes = @category&.cakes || Cake.all
    end
    tags = remove_stopwords(params[:tag_list].split.map { |tag| normalize_string(tag) })
    @cakes = @cakes.tagged_with(tags, :any => true).sort_by { |o| -(tags & o.tag_list).length }
    @cakes = @cakes.paginate(:page => params[:page], :per_page => 24)
  end
end
