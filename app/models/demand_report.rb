class DemandReport < ApplicationRecord
  belongs_to :user

  has_one_attached :picture

  enum status: [:awaits, :accepted, :canceled, :completed], _prefix: true

  after_initialize :set_status, :if => :new_record?

  def set_status
    self.status ||= :awaits
  end
end
