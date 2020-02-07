class OpinionsController < ApplicationController
  def index
    @opinion = Opinion.new
    @opinions = Opinion.where()
  end
end
