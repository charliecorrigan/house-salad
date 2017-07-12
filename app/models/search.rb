class Search
  def initialize(state)
    @state = state
  end

  def search_by_state
    unsorted_search_results = PropublicaService.new(state).search_by_state
    search_results = unsorted_search_results.sort_by { |member| member["seniority"].to_i }.reverse
  end

  private

    attr_reader :state
end