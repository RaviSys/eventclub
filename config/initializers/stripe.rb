# frozen_string_literal: true

Rails.configuration.stripe = {
  publishable_key: Rails.application.credentials.stripe[:PUBLISHABLE_KEY],
  secret_key: Rails.application.credentials.stripe[:SECRET_KEY]
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
