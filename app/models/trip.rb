class Trip < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  has_many :places
  has_many :flights

  def center
    if places.length == 0
      api_key = ENV['GOOGLE_MAPS_API_KEY']
      url = URI("https://maps.googleapis.com/maps/api/geocode/json?address=#{CGI::escape(title)}&key=#{api_key}")
      response = Net::HTTP.get(url)
      json = JSON.parse(response)
      results = json["results"]
      if results.empty?
        url = URI("https://maps.googleapis.com/maps/api/geocode/json?address=#{title.gsub(' ', '')}&key=#{api_key}")
        response = Net::HTTP.get(url)
        json = JSON.parse(response)
        results = json["results"]
      end
      if !results.empty?
        coords = results[0]["geometry"]["location"]
        place = Place.new(
          trip_id: 0,
          address: nil,
          name: nil,
          description: nil,
          image_url: nil,
          start_time: nil,
          end_time: nil,
          lat: coords["lat"],
          lng: coords["lng"]
        )
        places << place
      end
    end
    lat_sum = places.sum { |place|
      place[:lat]
    }
    avg_lat = lat_sum / (places.count == 0 ? 1 : places.count)
    lng_sum = places.sum { |place|
      place[:lng]
    }
    avg_lng = lng_sum / (places.count == 0 ? 1 : places.count)
    [avg_lat, avg_lng]
  end

  # calculate longest distance and make a conversion to a zoom factor for frontend map
  def initial_zoom
    curr_center = center
    max_distance = places.reduce(0){|max_distance, place| 
      dist = Geocoder::Calculations.distance_between([place.lat,place.lng], curr_center)
      dist > max_distance ? dist : max_distance
    }
    # custom function based on 4 different max distances with their associated zoom level
    zoom_level = -2.146039 + (22.86111 - -2.146039)/(1 + (max_distance/5.915623) ** 0.2311446)
    return max_distance == 0 ? 16 : zoom_level
  end

  def start_time_converted
    result = (start_time && start_time.strftime("%B %d, %Y")) || nil
    return result
  end

  def end_time_converted
    result = (end_time && end_time.strftime("%B %d, %Y")) || nil
    return result
  end

end
