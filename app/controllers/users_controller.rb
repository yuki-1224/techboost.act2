class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # binding.pry
    user = User.new(name: params[:name], email: params[:email])
    if user.save
      redirect_to root_path
    else
      render :new
    end
  end
end
