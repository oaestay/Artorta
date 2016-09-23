class DeliveryMailer < ApplicationMailer
  default from: "despachosartorta@gmail.com"

  def sample_email()
    mail(to: "oaestay@uc.cl", subject: "Sample email")
  end
end
