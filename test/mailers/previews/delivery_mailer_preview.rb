# Preview all emails at http://localhost:3000/rails/mailers/delivery_mailer
class DeliveryMailerPreview < ActionMailer::Preview
  def sample_email_preview()
    DeliveryMailer.sample_email()
  end
end
