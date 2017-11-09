class UsersController < ApplicationController
  def index
    @users = User.order('alias ASC').paginate(page: params[:page], per_page: 30)
    @profile = Profile.all
  end
end
