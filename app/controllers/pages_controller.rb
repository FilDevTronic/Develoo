class PagesController < ApplicationController
  def landing
    @profile = Profile.all
  end

  def contact; end

  def faq; end

  def settings
    @stripe_user_id = current_user.stripe_user_id
  end

  def create
    from_email = params[:email]
    message = params[:message]
    user_alias = params[:alias]

    @errors = []
    @errors << 'Error: Please enter an e-mail address' if from_email.blank?
    @errors << 'Error: Please enter a message to send' if message.blank?

    if @errors.empty?
      ContactMailer.contact_support(from_email, message).deliver_now
      render :success
    else
      render :new
    end
  end
end
