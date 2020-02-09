class OpinionsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @opinion = Opinion.new
    @opinions = Opinion.where(user_id: current_user.id)
  end

  def create
    @opinion = Opinion.new(opinion_params)
    @opinion.user_id = current_user.id
    if @opinion.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def opinion_params
    params.require(:opinion).permit(:content)
  end
end
