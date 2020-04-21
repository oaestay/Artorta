class WeddingToppingsController < ApplicationController
  def index
    @category = Category.where(slug: [:novios, :tortas_de_novios]).first
    @subcategory = params[:subcategory]
    @wedding_toppings = WeddingTopping.all.order(popularity: :desc).paginate(
      page: params[:page], per_page: 24
    )
  end
end
