class SearchController < ApplicationController
  def index
    conn = Faraday.new(:url => 'https://api.propublica.org/congress/v1/members/house/CO/current.json') 
    response = conn.get do |req|
      req.url 'https://api.propublica.org/congress/v1/members/house/CO/current.json'
      req.headers['X-API-Key'] = ENV["propublica_key"]
    end

    @search_results = JSON.parse(response.body)["results"]
  end

end
