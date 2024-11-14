class Trip < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  belongs_to :user
  has_many :places

  def center
    lat_sum = places.sum { |place|
      place[:lat]
    }
    avg_lat = lat_sum / (places.count == 0 ? 1 : places.count)
    pp "AVG LAT" + avg_lat.to_s

    lng_sum = places.sum { |place|
      place[:lng]
    }
    avg_lng = lng_sum / (places.count == 0 ? 1 : places.count)
    pp "AVG LNG" + avg_lng.to_s
    [avg_lat, avg_lng]
  end

  # calculate longest distance and make a conversion to a zoom factor
  def initial_zoom
    curr_center = center
    p "****************"
    max_distance = places.reduce(0){|max_distance, place| 
      dist = Geocoder::Calculations.distance_between([place.lat,place.lng], curr_center)
      pp "Dist " + dist.to_s
      dist > max_distance ? dist : max_distance
    }
    pp "Max Distance " + max_distance.to_s
    p "****************"

    zoom_level = -15.29434 + (2621.371 - -15.29434)/(1 + (max_distance / "6.019254e-34".to_f) ** 0.05907069)
    return max_distance < 1 ? 16 : zoom_level
    # 0.00015388678755598 * max_distance ** 2 - 0.12534948389316 * max_distance + 11.482425279053
  end

end
