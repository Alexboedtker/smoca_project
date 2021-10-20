class PagesController < ApplicationController
  def home
    response = HTTParty.get('https://api.punkapi.com/v2/beers')
    @search = params["search"]
    @results = []
    if @search.present?
      @results = response.select { |hash| (hash["description"].include?(@search["beer_query"]) || hash["name"].include?(@search["beer_query"])) }
    end
  end
end
