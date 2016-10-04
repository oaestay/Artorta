class DeliveriesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, :except => [:index, :new, :create]
  before_action :set_delivery, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @delivery = Delivery.new
  end

  def create
    dp = delivery_params
    @delivery = Delivery.new(dp)
    if @delivery.save
      respond_to do |format|
        flash[:notice] = "Despacho creado correctamente"
        DeliveryMailer.delivery_email(@delivery).deliver
        DeliveryMailer.delivery_email_admin(@delivery).deliver
        format.html { redirect_to deliveries_url }
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    dp = delivery_params
    respond_to do |format|
      if @delivery.update(dp)
        format.html { redirect_to @delivery, notice: 'Despacho actualizada correctamente' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @delivery.destroy
    flash[:notice] = "Despacho eliminado correctamente"
    redirect_to deliveries_url
  end

  private

  def set_delivery
    @delivery = Delivery.find(params[:id])
  end

  def delivery_params
    params.require(:delivery)
      .permit(:address, :province, :references, :first_name, :last_name, :phone, :cellphone, :date, :terms_and_conditions, :mail)
  end

end
