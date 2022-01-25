class Device < ApplicationRecord
  belongs_to :room, optional: true

  has_one_attached :qr_code

  enum device_type: [:bed, :tv, :ecg, :rtg, :computer, :printer, :extinguisher, :defibrillator, :other], _prefix: true
  enum status: [:fine, :broken, :outdated, :contaminated, :other], _prefix: true

  after_create :generate_qr

  def generate_qr
    GenerateQr.call(self)
  end
end
