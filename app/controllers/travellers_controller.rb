class TravellersController < ApplicationController
  def index
    

    @tours = Tour.all
  end
end
