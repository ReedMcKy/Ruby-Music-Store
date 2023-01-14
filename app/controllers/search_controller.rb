class SearchController < ApplicationController
  def index
    if params['artist']
      @response = Lastfm::Search.by_artist(params['artist'])
    end
  end
end
