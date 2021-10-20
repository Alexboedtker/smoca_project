class PagesController < ApplicationController
  def home
    response = HTTParty.get('https://api.punkapi.com/v2/beers')
    #take params and search through response[index]["name"] or response[index]["description"]
    #@beers_names = response.map { |hash| hash["name"] }
    #@beers_description = response.map { |hash| hash["description"] }
    @search = params["search"]
    @results = []
    if @search.present?
      @results = response.select { |hash| (hash["description"].include?(@search["beer_query"]) || hash["name"].include?(@search["beer_query"])) }
    end
  end
end
