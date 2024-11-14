class Place < ApplicationRecord
  validates :name, presence: true

  belongs_to :trip

  def start_time_converted
    result = (start_time && start_time.strftime("%B %d, %Y")) || nil
    return result
  end

  def end_time_converted
    result = (end_time && end_time.strftime("%B %d, %Y")) || nil
    return result
  end
end
