class ExcursionsController < ApplicationController
  before_action :find_excursion, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    # @excursions = Excursion.all

    client = Algolia::Search::Client.create('QSMHTAERIJ', '0f04d30b0769ccd0ad152b7d7dbea633')
    index = client.init_index('Excursion')

    # Perform the search based on user input
    query = params[:query]

    if query.present?
      # @excursions = index.search(query)['hits']
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
          length: excursion.length,
          average_rating: excursion.average_rating
        }
      end

      render json: @formatted_excursions
    else
      @excursions = Excursion.all # Fetch all excursions when there's no search query
    end

    # raise
    # Debugging statements
    # puts "Query: #{query}"
    # puts "Excursions: #{@excursions.inspect}"

    # respond_to do |format|
    #   format.html { render 'index' }
    #   format.json { render json: @formatted_excursions }
    # end
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
      redirect_to root_path, notice: "Excursion was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @excursion.update(excursion_params)
      # Checks if the excursion object is successfully updated using the provided parameters.
      # '@excursion' likely refers to an instance variable holding an excursion object.

      redirect_to excursion_path, notice: 'Excursion was successfully updated.'
      # Redirects the user to a specific route after a successful update.
      # The 'notice' parameter provides a success message that will be displayed to the user.
    else
      render :edit
      # If the update fails, it renders the 'edit' view again to show errors or allow further editing.
    end
  end

  # def search
  #   client = Algolia::Search::Client.create('QSMHTAERIJ', '0f04d30b0769ccd0ad152b7d7dbea633')
  #   index = client.init_index('Excursion')

  #   # Perform the search based on user input
  #   query = params[:query]
  #   # search_result = index.search(query)
  #   @searched_excursions = index.search(query)['hits']
  #   # raise

  #   # Check if search_result is not nil and has hits
  #   # if search_result && search_result['hits']
  #   #   # Assuming your data structure includes '_source' and '_highlightResult'
  #   #   @excursions = search_result['hits'].map do |hit|
  #   #     # source = hit['_source'] || {}
  #   #     # highlight_result = hit['_highlightResult'] || {}
  #   #     # excursion = source.merge(highlight_result)
  #   #     # excursion.transform_keys(&:to_sym) # Convert keys to symbols
  #   #     hit.transform_keys(&:to_sym)
  #   #   end
  #   # else
  #   #   @excursions = []  # or handle the nil case as per your requirements
  #   # end

  #   # @excursions = search_result['hits'] #if search_result && search_result['hits']
  #   raise
  #   respond_to do |format|
  #     format.html { render 'index' }
  #     format.json { render json: @excursions }
  #   end
  # end
  # def search
  #   client = Algolia::Search::Client.create('QSMHTAERIJ', '0f04d30b0769ccd0ad152b7d7dbea633')
  #   index = client.init_index('Excursion')

  #   # Perform the search based on user input
  #   query = params[:query]
  #   @excursions = if query.present?
  #                   index.search(query)['hits']
  #                 else
  #                   Excursion.all # Fetch all excursions when there's no search query
  #                 end
  #   raise
  #   respond_to do |format|
  #     format.html { render 'index' }
  #     format.json { render json: @excursions }
  #   end
  # end
  def search
    # client = Algolia::Search::Client.create('QSMHTAERIJ', '0f04d30b0769ccd0ad152b7d7dbea633')
    # index = client.init_index('Excursion')

    # # Perform the search based on user input
    # query = params[:query]

    # @excursions = if query.present?
    #                 index.search(query)['hits']
    #               else
    #                 Excursion.all # Fetch all excursions when there's no search query
    #               end

    # raise

    # # Debugging statements
    # puts "Query: #{query}"
    # puts "Excursions: #{@excursions.inspect}"

    # respond_to do |format|
    #   format.html { render 'index' }
    #   format.json { render json: @excursions }
    # end
  end

  def destroy
    @excursion.destroy
    # if @excursion.destroy
    #   redirect_to excursion_path, notice: "Excursion was successfully deleted."
    # else
    #   render :show, notice: "Excursion cannot be deleted, please try again!"
    # end
    respond_to do |format|
      format.html { redirect_to excursions_path, notice: "Excursion was successfully deleted." }
      format.json { head :no_content }
    end
  end

  def upvote
    unless user_signed_in?
      redirect_to new_user_session_path
    else
      @excursion = Excursion.find(params[:id])
      @excursion.liked_by current_user
      redirect_to @excursion
    end
end

def downvote
    unless user_signed_in?
      redirect_to new_user_session_path
    else
      @excursion = Excursion.find(params[:id])
      @excursion.downvote_from current_user
      redirect_to @excursion
    end
end

  private

  def find_excursion
    @excursion = Excursion.find(params[:id])
  end

  def excursion_params
    params.require(:excursion).permit(:title, :city, :capacity, :category, :length, :description, image: [])
  end
end
