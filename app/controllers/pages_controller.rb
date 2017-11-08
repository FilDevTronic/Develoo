class PagesController < ApplicationController
  def landing
    @profile = Profile.all
  end

  def contact
  end

  def faq
  end

  def settings
    @stripe_user_id = current_user.stripe_user_id
  end
end
