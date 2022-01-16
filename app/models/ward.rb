class Ward < ApplicationRecord
  belongs_to :floor
  has_many :rooms
end
