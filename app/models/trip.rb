class Trip < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  belongs_to :user
  has_many :places

  def center
    lat_sum = places.sum { |place|
      place[:lat]
    }
    avg_lat = lat_sum / places.count
    pp "AVG LAT" + avg_lat.to_s

    lng_sum = places.sum { |place|
      place[:lng]
    }
    avg_lng = lng_sum / places.count
    pp "AVG LNG" + avg_lng.to_s
    [avg_lat, avg_lng]
  end
end
