class PropublicaService
  def initialize(state)
    @state = state
  end

  def search_by_state
    conn = Faraday.new(:url => "https://api.propublica.org/congress/v1/members/house/#{state}/current.json") 
    response = conn.get do |req|
      req.url "https://api.propublica.org/congress/v1/members/house/#{state}/current.json"
      req.headers['X-API-Key'] = ENV["propublica_key"]
    end

    unsorted_results = JSON.parse(response.body)["results"]
  end
  private
    attr_reader :state
end