class Floor < ApplicationRecord
  belongs_to :building
  has_many :wards, dependent: :destroy
end
