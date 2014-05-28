class SheltersController < ApplicationController
  require 'petfinder'
  require 'time'

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
  	

  	year = 31540020

  	@shelters.delete_if do |shelter|
  		pet = @petfinder_client.shelter_pets(shelter.id, {"count" => 1})
  		if pet.first.nil?
  			true
  		else
	  		ptime = Time.parse(pet.first.last_update)
	  		if Time.now - ptime >= year
	  			true
	  		end
	  	end
  	end

  end

  def view
  	@shelter = @petfinder_client.shelter(params[:id])
  	@petfinder = @petfinder_client.shelter_pets(params[:id])
  end
end
