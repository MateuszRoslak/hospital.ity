class Room < ApplicationRecord
  belongs_to :ward
  has_many :devices

  enum room_type: [:patients, :toilet, :storage, :office, :surgery, :post_surgery], _prefix: true
end
