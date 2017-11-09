class ChargesController < ApplicationController
  # post /checkout
  def create
    # Look up the product so we can:
    # - Set the price
    # - Grab the owner's stripe ID to distribute funds
    @commission = Commission.find(params[:id])

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: (@commission.price * 100).to_i,
      description: @commission.title,
      currency: 'AUD',
      # Strip connect magic, send 80% of the funds (keep 20% cut)
      destination: {
        amount: (@commission.price * 100 * 0.8).to_i,
        account: @commission.user.stripe_user_id
      }
    )

    flash[:notice] = "Your purchase was successful. Your card was charged #{@commission.price}"

    seller_notification = "Customer [#{charge.customer}] with email #{customer.email} just purchased #{charge.description} for $#{@commission.price * 0.8} #{charge.currency}"

    PurchaseMailer.mail_purchase_notification(customer.email, @commission.user.email, seller_notification).deliver_now

    client_confirmation = "Your commission for #{@commission.title} to make you a #{@commission.description} was successfully made and your card was charged for $#{@price_in_dollars}. Please contact us on our website if you experience any issues. #{@commission.user.alias} should be in touch with you soon regarding your commission."

    PurchaseMailer.mail_purchase_confirmation(customer.email, client_confirmation).deliver_now

    # Log the response from Stripe
    puts charge.inspect

    # Success!
    redirect_to charges_thankyou_path
  rescue Stripe::CardError => e
    flash[:notice] = e.message
    redirect_to @commission
  end
end
