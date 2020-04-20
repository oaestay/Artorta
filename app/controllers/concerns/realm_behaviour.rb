# frozen_string_literal: true

module RealmBehaviour
  extend ActiveSupport::Concern

  included do
    helper_method :current_realm
  end

  def current_realm
    decorated_subdomain? ? :decorated : :traditional
  end

  private

  def decorated_subdomain?
    request.subdomain == 'decoradas'
  end
end
