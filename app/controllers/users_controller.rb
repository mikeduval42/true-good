class UsersController < ApplicationController
  respond_to :json, :html

  # /you.json give you the current user
  def you
    respond_with current_user
  end

    # /users.json
  def index
    @users = User.all
    respond_with @users
  end

  def show
    @user = User.find(params[:id])
    respond_with @user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You have signed up successfully"
      session[:remember_token] = @user.id
      @current_user = @user
      redirect_to :root
    else
      render :new
    end
  end

  protected

  def user_params
    params.require(:user).permit(:name, :email, :password, :resident, :volunteer, :corporation, :phone_number, :reference, :reference_contact, :address, :city, :state, :zip, :background_check)
  end
end