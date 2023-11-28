class ExcursionsController < ApplicationController
  def index
    @excursions = Excursion.all
  end

  def show
    @excursions = Excursion.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def like
  end

  def dislike
  end
end
