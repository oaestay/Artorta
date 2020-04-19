class PagesController < ApplicationController
  def buy; end

  def delivery; end

  def flavours; end

  def home; end

  def location; end

  def press
    @press_items = Press.all.order(name: :asc).paginate(page: params[:page], per_page: 24)
  end
  def companies
    @companies = Company.all.order(name: :asc).paginate(page: params[:page], per_page: 24)
  end

  def us; end
end
