class Device < ApplicationRecord
  belongs_to :room, optional: true

  enum device_type: [:bed, :tv, :ecg, :rtg, :computer, :printer, :extinguisher, :defibrillator, :other], _prefix: true
  enum status: [:fine, :broken, :outdated, :contaminated, :other], _prefix: true
end
  