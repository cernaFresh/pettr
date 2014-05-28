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

  def set_meta_info(animal)
    @meta_description = 'Find ' + animal +  ' available for adoption in Grand Junction, Colorado and throughout the western slope'
  end

  def get_animal_type(animal)
    case animal
    when "Barnyard Animals"
      animal_type = "barnyard"
    when "Birds"
      animal_type = "bird"
    when "Cats"
      animal_type = "cat"
    when "Dogs"
      animal_type = "dog"
    when "Horses"
      animal_type = "horse"
    when "Pigs"
      animal_type = "pig"
    when "Reptiles"
      animal_type = "reptiles"
    when "Small and Furry Animals"
      animal_type = "smallfurry"
    else
      animal_type = "cat"
    end
    animal_type
  end

  def set_petfinder(animal)
    set_meta_info(animal)
    animal_type = get_animal_type(animal)
    @petfinder = @petfinder_client.find_pets(animal_type, @zipcode)

    render :layout => 'application'
  end

  public
  def barnyard
    @animal = 'Barnyard Animals'
    set_petfinder(@animal)
  end

  def bird
    @animal = 'Birds'
    set_petfinder(@animal)
  end

  def cat
    @animal = 'Cats'
    set_petfinder(@animal)
  end

  def dog
    @animal = 'Dogs'
    set_petfinder(@animal)
  end

  def horse
    @animal = 'Horses'
    set_petfinder(@animal)
  end

  def pig
    @animal = 'Pigs'
    set_petfinder(@animal)
  end

  def reptile
    @animal = 'Reptiles'
    set_petfinder(@animal)
  end

  def smallfurry
    @animal = 'Small and Furry Animals'
    set_petfinder(@animal)
  end

  def view
    @petfinder = Array.new
    @petfinder << @petfinder_client.pet(params[:id])
    @animal = 'view'

    render :layout => 'application'
  end
end