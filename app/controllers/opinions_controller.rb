class OpinionsController < ApplicationController
  before_action :authorize, only: [:index]

  def index
    @opinion = Opinion.new
    @opinions = Opinion.get_related_opinions(current_user.id)
    @users = User.find_friends(current_user.id)
  end

  def create
    @opinion = Opinion.new(opinion_params)
    @opinion.AuthorId = current_user.id
    @users = User.find_friends(current_user.id)
    @opinions = Opinion.get_related_opinions(current_user.id)

    if @opinion.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def opinion_params
    params.require(:opinion).permit(:Text)
  end
end
