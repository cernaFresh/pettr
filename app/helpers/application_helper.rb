module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = get_brand
    if page_title.empty?
      base_title
    else
      "#{base_title + ' | ' + page_title}"
    end
  end

  def get_brand
    "Pettr"
  end

  def meta_tag(meta_tag)
    "#{meta_tag}"
  end

  def meta_tag_image(og_image)
    base_image = 'http://pettr.skytable.net' + image_path("skytable-star.png")
    if og_image.empty?
      base_image
    else
      "#{'http://pettr.skytable.net' + og_image}"
    end
  end

  def canon_url
    "#{request.protocol}#{request.host_with_port}#{request.fullpath}"
  end

  def pet_url(id)
    url1 = canon_url
    "#{request.protocol}#{request.host_with_port}/pets/#{id}"
  end

  def shelter_url(id)
    url1 = canon_url
    "#{request.protocol}#{request.host_with_port}/shelters/#{id}"
  end

  def metatag_animal_image(animal)
    case animal
    when "Barnyard Animals"
      animal_image = "barnyard_cube_fb.jpg"
    when "Birds"
      animal_image = "bird_cube_fb.jpg"
    when "Cats"
      animal_image = "cats_cube_fb.jpg"
    when "Dogs"
      animal_image = "dogs_cube_fb.jpg"
    when "Horses"
      animal_image = "horses_cube_fb.jpg"
    when "Pigs"
      animal_image = "pigs_cube_fb.jpg"
    when "Reptiles"
      animal_image = "reptiles_cube_fb.jpg"
    when "Small and Furry Animals"
      animal_image = "smallfurry_cube_fb.jpg"
    else
      animal_image = "cats_cube_fb.jpg"
    end

    animal_image

  end

  def pet_list_info(animal)
    if animal.eql?('view')
      raw("<h1 class=\"listings-title\">Now viewing:</h1>")
    elsif animal.nil?
      
    else
      raw("#{'<h1 class="listings-title">' + animal + '</h1>
        <div class="alert alert-info alert-dismissable">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        Showing ' + animal.downcase + ' near Grand Junction, CO
        </div>'}")
    end
  end

  def readable_time_stamp(time)
    Time.parse(time).asctime
  end

  def animal_info(pets)
    case pets.size
    when 'L'
      size = "large"
    when 'M'
      size = "medium"
    when 'S'
      size = 'small'
    else
      size = ''
    end
    case pets.sex
    when 'M'
      gender = 'male'
    when 'F'
      gender = 'female'
    else
      gender = 'unknown'
    end
    "#{size} #{pets.age.downcase} #{gender}"
  end
  def find_shelter_name(id)
    # "WOW"
    shelter = Shelter.where(shelter_id: id).first
    if shelter.nil?
      "click for shelter info"
    else
      "#{shelter.attributes.values[2]}"
    end
  end

end
