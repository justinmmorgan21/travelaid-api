class Trip < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  has_many :places
  has_many :flights

  def center
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
