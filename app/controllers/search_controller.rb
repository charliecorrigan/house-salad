class SearchController < ApplicationController
  def index
    @search_results = Search.new(params["state"]).search_by_state
  end

end
