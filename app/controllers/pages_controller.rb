class PagesController < ApplicationController
  def home
    response = HTTParty.get('https://api.punkapi.com/v2/beers')
    #take params and search through response[index]["name"] or response[index]["description"]
    #create a list with the returned response
    #what gets returned? what gets displayed?
    @beers_names = response.map { |hash| hash["name"] }
    @beers_description = response.map { |hash| hash["description"] }
    @search = params["search"]
    if @search.present?
      @result = @beers_names.find { |name| name == @search["beer_query"] }
    end

    #need to use @search["beer_query"] to search through the response for the correct beer
    #
  end
end
