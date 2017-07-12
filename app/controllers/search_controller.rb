class SearchController < ApplicationController
  def index
    conn = Faraday.new(:url => "https://api.propublica.org/congress/v1/members/house/#{params["state"]}/current.json") 
    response = conn.get do |req|
      req.url "https://api.propublica.org/congress/v1/members/house/#{params["state"]}/current.json"
      req.headers['X-API-Key'] = ENV["propublica_key"]
    end

    unsorted_results = JSON.parse(response.body)["results"]
    @search_results = unsorted_results.sort_by { |member| member["seniority"].to_i }.reverse
    binding.pry
  end

end
