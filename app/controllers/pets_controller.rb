class PetsController < ApplicationController
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

  def set_petfinder(animal)
    @petfinder = @petfinder_client.find_pets(animal, @zipcode)

    render :layout => 'application'
  end

  public
  def barnyard
    set_petfinder('barnyard')
  end

  def bird
    set_petfinder('bird')
  end

  def cat
    set_petfinder('cat')
  end

  def dog
    set_petfinder('dog')
  end

  def horse
    set_petfinder('horse')
  end

  def pig
    set_petfinder('pig')
  end

  def reptile
    set_petfinder('reptile')
  end

  def smallfurry
    set_petfinder('smallfurry')
  end

  def view
    @petfinder = Array.new
    @petfinder << @petfinder_client.pet(params[:id])

    render :layout => 'application'
  end
end