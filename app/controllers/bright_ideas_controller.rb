class BrightIdeasController < ApplicationController
  def index
    @ideas=BrightIdea.all
    
  end

  def new
  end

  def create
    print "?????????????????????????????????"
    print session[:user_id]
    print "?????????????????????????????????"
    @newidea=BrightIdea.create(content:params[:content], user_id:session[:user_id])
    if @newidea.errors.any?
      flash[:message]= "Idea cannot be blank"
      redirect_to '/bright_ideas/index'
    else
      print BrightIdea.all
      redirect_to '/bright_ideas/index'
    end
  end

  def show
    @show= BrightIdea.find(params[:id])
    render 'show'
  end
  def update
  #   # @edit+=1
  #   @edit=BrightIdea.where(id:params[:id]).update_all(like:params[:like])
  #   redirect_to '/bright_ideas/index'
  end
  def destroy
    @ideadelete= BrightIdea.find(params[:id])
    @ideadelete.destroy
    redirect_to '/bright_ideas/index'
  end
end
