class PagesController < ApplicationController
  def home
    response = HTTParty.get('https://api.punkapi.com/v2/beers')
  end
end
