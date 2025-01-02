class UsersController < ApplicationController
  # GET /users/:id
  def show
    #@user = User.first
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
    # => app/views/users/new.html.erb
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # => Success
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      # =>Failure
      render 'new', status: :unprocessable_entity
    end
  end

  private
    # Strong Parameter
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end