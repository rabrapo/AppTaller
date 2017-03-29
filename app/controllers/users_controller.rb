class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.page(params[:page]).per(5)
    # ajax request will result in request.xhr? not nil
    # layout will be true if request is not an ajax request
    render action: :index, layout: request.xhr? == nil
  end

  def new
    @user = User.new
  end

  def show
    @user = User.friendly.find(params[:id])
  end

  def create
    @user = User.new(user_params) #strong parameters
    if @user.save
      UserMailer.account_activation(@user).deliver_now
      flash[:info] = "Revise su email para activar su cuenta"
      redirect_to root_url
      #log_in @user
      #flash[:success] = "¡Bienvenido a Tallares Rabrapo!"
      #redirect_to @user
    else
      flash[:alert] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    @user = User.friendly.find(params[:id])
  end

  def update
    @user = User.friendly.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Perfil actualizado"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    #strong parameters
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # Before filters

    # Confirmar inicio de sesión.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Por favor, inicie sesión."
        redirect_to entrar_url
      end
    end
    # Confirmar usuario correcto
    def correct_user
      @user = User.friendly.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
