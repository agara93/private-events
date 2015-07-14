class SessionsController < ApplicationController
  def new
  end
  
  def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user
        sign_in user
        redirect_to user
      else
        flash.now[:warning]="You're not registered, please sign up"
        render 'new'
      end
  end
  
  def destroy
      sign_out
      redirect_to root_path
  end
end
