class PetsController < ApplicationController
  require 'petfinder'
  def initialize
    Petfinder.configure do |config|
      config.api_key = '8d900ecce0d4ac3a40f7184f0cc0cbe8'
      config.api_secret = '502bdd9ef413243d40296ed4fe9efd2f'
    end

    @petfinder_client = Petfinder::Client.new

  end

  def barnyard
  end

  def bird
  end

  def cat
    @petfinder = @petfinder_client.shelter_pets('CO22')

    render :layout => 'application'
  end

  def dog
  end

  def horse
  end

  def pig
  end

  def reptile
  end

  def smallfurry
  end

  def view
  end
end