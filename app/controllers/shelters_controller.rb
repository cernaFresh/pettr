class SheltersController < ApplicationController
  require 'petfinder'

  before_filter :load_vars
  protected
  def load_vars
    Petfinder.configure do |config|
      config.api_key = '8d900ecce0d4ac3a40f7184f0cc0cbe8'
      config.api_secret = '502bdd9ef413243d40296ed4fe9efd2f'
    end

    @petfinder_client = Petfinder::Client.new
    @zipcode = 81501
  end

  public
  def index
  	@shelters = @petfinder_client.find_shelters(@zipcode)
  end

  def view
  	@shelter = @petfinder_client.shelter(params[:id])
  	@petfinder = @petfinder_client.shelter_pets(params[:id])
  end
end
