class SessionsController < ApplicationController

	def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase) 
  	if user && user.authenticate(params[:session][:password])
      log_in user
      remember user
      flash[:success] = "Welcome"
      redirect_to user
    else
  		flash.now[:danger] = 'Invalid email or password!'
  		render 'new'
  	end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = "Good by. Have a nice day ;)"
    redirect_to root_path
  end
end
