class PagesController < ApplicationController

  def buy

  end

  def flavours
  end

  def press
  end

  def location
  end

  def us
  end

  def delivery
  end

  def mail_test
    DeliveryMailer.sample_email().deliver
  end

end
