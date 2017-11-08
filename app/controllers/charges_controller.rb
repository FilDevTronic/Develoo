class ChargesController < ApplicationController
  # post /checkout
  def create

    # Look up the product so we can:
    # - Set the price
    # - Grab the owner's stripe ID to distribute funds
    @commission = Commission.find(params[:id])

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => (@commission.price * 100).to_i,
      :description => @commission.title,
      :currency    => 'aud',
      # Strip connect magic, send 80% of the funds (keep 20% cut)
      :destination => {
        :amount => (@commission.price * 100 * 0.8).to_i,
        :account => @commission.user.stripe_user_id,
      }
    )

    # Log the response from Stripe
    puts charge.inspect

    # Success!
    redirect_to charges_thankyou_path

    rescue Stripe::CardError => e
      flash[:notice] = e.message
      redirect_to @commission
  end
end
