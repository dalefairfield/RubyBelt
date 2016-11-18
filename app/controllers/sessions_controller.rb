class SessionsController < ApplicationController
  def new
  end
  def login
    user= User.find_by_email(params[:email])
    if user == nil
      flash[:message]= ["Invalid Email"]
      flash[:message].append("Invalid")
      redirect_to '/users/new'
    else
      if user.authenticate(params[:password])
        session[:user_id]=user.id
        redirect_to "/users/#{user.id}"
      else
        flash[:message]="Invalid password"
        flash[:message].append("Invalid")
        redirect_to '/users/new'
      end
    end
end
