class DeliveryMailer < ApplicationMailer
  default from: "despachosartorta@gmail.com"

  def sample_email()
    mail(to: "oaestay@uc.cl", subject: "Sample email")
  end

  def delivery_email(delivery)
    @full_name = delivery.first_name + " " + delivery.last_name
    @phone = delivery.phone
    @cellphone = delivery.cellphone
    @date = I18n.localize(delivery.date, :format => '%d %B, %Y' )
    @address = delivery.address
    @province = delivery.province
    @references = delivery.references
    mail(:to => delivery.mail, :subject => "Despacho generado") do |format|
      format.text { render :text => "delivery_email" }
      format.html { render 'delivery_email' }
    end
  end

  def delivery_email_admin(delivery)
    @full_name = delivery.first_name + " " + delivery.last_name
    @phone = delivery.phone
    @cellphone = delivery.cellphone
    @date = I18n.localize(delivery.date, :format => '%d %B, %Y' )
    @address = delivery.address
    @province = delivery.province
    @references = delivery.references
    @email = delivery.mail
    mail(:to => "info@artorta.cl", :subject => "Despacho generado") do |format|
      format.text { render :text => "delivery" }
      format.html { render 'delivery' }
    end
  end
end
