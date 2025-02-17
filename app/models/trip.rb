class Trip < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  has_many :places
  has_many :flights

  def update_center(invalid_address, place_id)
    # If there are places, return average of their lat and lng
    api_key = ENV['GOOGLE_MAPS_API_KEY']
    total_lat = 0
    total_lng = 0
    valid_places = 0

    places.each do |place|
      # If place has lat/lng, use it; otherwise, fetch from Google API
      if place.lat.nil? || place.lng.nil?
        google_data = fetch_place_details(place.name, api_key)
        if google_data
          place.update(lat: google_data[:lat], lng: google_data[:lng])
          if invalid_address && place.id == place_id
            place.update(address: google_data[:address])
          end
        end
      end

      if place.lat && place.lng
        total_lat += place.lat
        total_lng += place.lng
        valid_places += 1
      end
    end
    
    if valid_places.positive?
      avg_lat = total_lat / valid_places
      avg_lng = total_lng / valid_places
      update(lat: avg_lat, lng: avg_lng)
    else
      google_data = fetch_place_details(title, api_key)
      if google_data
        update(lat: google_data[:lat], lng: google_data[:lng])
      end
    end
    self
  end

  # calculate longest distance and make a conversion to a zoom factor for frontend map
  def initial_zoom
    curr_center = [lat, lng]
    max_distance = places.reduce(0){|max_distance, place| 
      dist = Geocoder::Calculations.distance_between([place.lat,place.lng], curr_center)
      dist > max_distance ? dist : max_distance
    }
    # custom function based on 4 different max distances with their associated zoom level 
    zoom_level = -2.146039 + (22.86111 - -2.146039)/(1 + (max_distance/5.915623) ** 0.2311446)
    return max_distance == 0 ? 15 : zoom_level
  end

  def start_time_converted
    result = (start_time && start_time.strftime("%B %d, %Y")) || nil
    return result
  end

  def end_time_converted
    result = (end_time && end_time.strftime("%B %d, %Y")) || nil
    return result
  end


  private

    def fetch_place_details(name, api_key)
      url = URI("https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{CGI.escape(name)}&key=#{api_key}")
      response = Net::HTTP.get(url)
      json = JSON.parse(response)
      if json["results"].any?
        {
          lat: json["results"][0]["geometry"]["location"]["lat"],
          lng: json["results"][0]["geometry"]["location"]["lng"],
          address: json["results"][0]["formatted_address"]
        }
      else
        nil
      end
    end
end
