class UsersController < ApplicationController
  def new
  end

  def create
    @new = User.new(name:params[:name], alias:params[:alias], email:params[:email], password:params[:password], password_confirmation:params[:password_confirmation])
    if @new.save
      # render 'new'
      session[:user_id]=@new.id
      redirect_to '/bright_ideas/index'
    else
      flash[:message]= "Invalid register"
      redirect_to '/users/new'
    end
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
        session[:alias]=user.alias
        redirect_to '/bright_ideas/index'
      else
        flash[:message]="Invalid password"
        flash[:message].append("Invalid")
        redirect_to '/users/new'
      end
    end
  end
  def show
    @user=User.find(params[:id])
  end
  def logout
    reset_session
    redirect_to '/users/new'
  end

end
