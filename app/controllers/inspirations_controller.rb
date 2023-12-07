class InspirationsController < ApplicationController
  def new
    @inspiration = Inspiration.new
  end

  def create
    @inspiration = Inspiration.new(inspiration_params)
    ## figure out what chat returns (data type)
    @suggestions = generate_excursion_suggestions(@inspiration)
    if @inspiration.save
      redirect_to inspiration_path(@inspiration), notice: 'Here is a list of suggested excursions.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @inspiration = Inspiration.find(params[:id])
    @excursion = Excursion.new(title: "inspired name", capacity: @inspiration.capacity, city: @inspiration.location,
                               length: "@inspiration.duration", description: "inspired description",
                               setting: @inspiration.setting, category: "inspired category")
    @suggestions = generate_excursion_suggestions(@inspiration)
    @suggestions_array = @suggestions[0].split("\n\n")
    # @excursion = Excursion.new
  end

  private

  def inspiration_params
    params.require(:inspiration).permit(:capacity, :budget, :setting, :location, :interests, :duration, :requirements)
  end

  def generate_excursion_suggestions(inspiration)
    client = OpenAI::Client.new

    prompt = "Suggest 10 excursions based on the following inspiration:\n"
    prompt += "Capacity: #{inspiration.capacity}\n"
    prompt += "Budget: #{inspiration.budget}\n"
    prompt += "Setting: #{inspiration.setting}\n"
    prompt += "Location: #{inspiration.location}\n"
    prompt += "Interests: #{inspiration.interests}\n"
    prompt += "Duration: #{inspiration.duration}\n"
    prompt += "Requirements: #{inspiration.requirements}\n"

    chatgpt_response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [
          { role: "system", content: "You are a helpful assistant that suggests excursions." },
          { role: "user", content: prompt }
        ]
      }
    )
    chatgpt_response["choices"].map { |choice| choice["message"]["content"] }
  end
end
