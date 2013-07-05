class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      login(@user)
    else
      flash[:messages] ||= []
      flash[:messages] << @user.errors.full_messages

      redirect_to new_user_url
    end
  end

  def show
    @user = current_user
    @places = current_user.places
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])

    redirect_to dashboard_url
  end
end
