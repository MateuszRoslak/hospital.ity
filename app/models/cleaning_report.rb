class CleaningReport < ApplicationRecord
  belongs_to :user

  after_create :clean_rooms

  def clean_rooms
    CleanRooms.call(self.room_ids, self.user_id)
  end
end
