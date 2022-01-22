class Building < ApplicationRecord
  has_many :floors, dependent: :destroy
end
