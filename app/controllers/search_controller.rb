class SearchController < ApplicationController
  def index
    response = Faraday.get("https://api.propublica.org/congress/v1/members/house/CO/current.json")
    @search_results = JSON.parse(response.body)
    binding.pry
  end

end
