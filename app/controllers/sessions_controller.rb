class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.friendly.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message  = "Cuenta no activada. "
        message += "Revise su correo y siga nuestras instrucciones."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Combinación de email/contraseña inválida'
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
