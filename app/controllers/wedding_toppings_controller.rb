class WeddingToppingsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :set_wedding_topping, only: [:show, :edit, :update, :destroy]

  def index
    @wedding_toppings = WeddingTopping.all.order("popularity desc").paginate(page: params[:page], per_page: 24)
    @title = "Tortas de novios"
    @menu = "novios"
    @submenu = MENU_NOVIOS
  end

  def show
    @wedding_topping.popularity += 1
    @wedding_topping.save
    respond_to do |format|
      format.html # show.html.erb
      format.js # show.js.erb
    end
  end

  def new
    @wedding_topping = WeddingTopping.new
  end

  def edit
  end

  def create
    @wedding_topping = WeddingTopping.new(wedding_topping_params)

    respond_to do |format|
      if @wedding_topping.save
        format.html { redirect_to @wedding_topping, notice: 'Wedding topping was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @wedding_topping.update(wedding_topping_params)
        format.html { redirect_to @wedding_topping, notice: 'Wedding topping was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @wedding_topping.destroy
    respond_to do |format|
      format.html { redirect_to wedding_toppings_url, notice: 'Wedding topping was successfully destroyed.' }
    end
  end

  private
    def set_wedding_topping
      @wedding_topping = WeddingTopping.find(params[:id])
    end

    def wedding_topping_params
      params.require(:wedding_topping).permit(:name, :code, :popularity, :image)
    end
end
