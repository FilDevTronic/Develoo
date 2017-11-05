class PagesController < ApplicationController
  def landing
    @profile = Profile.all
  end

  def contact
  end

  def faq
  end
end
