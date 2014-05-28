# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Shelter.create(name: 'Roice-Hurst Humane Soceity', population: 81831000)


require 'petfinder'


Petfinder.configure do |config|
  config.api_key = '8d900ecce0d4ac3a40f7184f0cc0cbe8'
  config.api_secret = '502bdd9ef413243d40296ed4fe9efd2f'
end

@petfinder_client = Petfinder::Client.new
@zipcode = 81501

@shelters = @petfinder_client.find_shelters(@zipcode)

@shelters.each do |shelter|
	Shelter.create(shelter_id: shelter.id, name: shelter.name, address1: shelter.address1, address2: shelter.address2, city: shelter.city, state: shelter.state, zip: shelter.zip, phone: shelter.phone, fax: shelter.fax, email: shelter.email)
end