class ExcursionsController < ApplicationController
  before_action :find_excursion, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    client = Algolia::Search::Client.create('QSMHTAERIJ', '0f04d30b0769ccd0ad152b7d7dbea633')
    index = client.init_index('Excursion')
    query = params[:query]

    if query.present?
      @excursions = index.search(query)[:hits]
      @formatted_excursions = @excursions.map do |hit|
        excursion = Excursion.find(hit[:id])
        {
          id: excursion.id,
          title: excursion.title,
          image_key: excursion.image.key,
          city: excursion.city,
          description: excursion.description,
          capacity: excursion.capacity,
          category: excursion.category,
          review: excursion.review,
          duration: excursion.duration,
          average_rating: excursion.average_rating
        }
      end

      render json: @formatted_excursions
    else
      @excursions = Excursion.all
    end
  end

  def show
    @excursion = Excursion.find(params[:id])
  end

  def new
    @excursion = Excursion.new
  end

  def create
    @excursion = Excursion.new(excursion_params)
    @user = current_user
    @excursion.user = @user
    if @excursion.save
      redirect_to excursion_path(@excursion), notice: "Excursion was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @excursion.update(excursion_params)
      redirect_to excursion_path, notice: 'Excursion was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @excursion.destroy
    respond_to do |format|
      format.html { redirect_to excursions_path, notice: "Excursion was successfully deleted." }
      format.json { head :no_content }
    end
  end

  def like
  end

  def dislike
  end

  private

  def find_excursion
    @excursion = Excursion.find(params[:id])
  end

  def excursion_params
    params.require(:excursion).permit(:title, :city, :capacity, :setting, :category, :length, :description, image: [])
  end
end
