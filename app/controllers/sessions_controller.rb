class SessionsController < ApplicationController
  def new
  end
  
  def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user
        signin user
        redirect_back_or user
      else
        flash.now[:error]="You're not registered, please sign up"
        render 'new'
      end
  end
  
  def destroy
      signout
      redirect_to root_path
  end
end
