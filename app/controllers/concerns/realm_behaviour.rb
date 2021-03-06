# frozen_string_literal: true

module RealmBehaviour
  extend ActiveSupport::Concern

  included do
    helper_method :current_realm
    helper_method :use_scoped_resources?
    helper_method :decorated_subdomain?
  end

  def current_realm
    decorated_subdomain? ? :decorated : :traditional
  end

  def use_scoped_resources?
    Cake.where(realm: :traditional).any?
  end

  def decorated_subdomain?
    request.subdomain == 'decoradas'
  end
end
