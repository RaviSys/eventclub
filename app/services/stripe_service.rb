# frozen_string_literal: true

class StripeService
  def initialize(amount, email, stripe_token)
    @amount = amount
    @email = email
    @stripe_token = stripe_token
  end

  def customer
    Stripe::Customer.create(email: @email,
                            source: @stripe_token)
  end

  def charge(customer)
    Stripe::Charge.create(amount: @amount,
                          currency: 'usd',
                          customer: customer)
  end
end
