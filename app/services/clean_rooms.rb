class CleanRooms < ApplicationService
  attr_reader :room_ids, :user_id

  def initialize(room_ids, user_id)
    @user_id = user_id
    @room_ids = room_ids
  end

  def call
    rooms = Room.all.where(id: @room_ids)
    rooms.each do |room|
      room.update!(last_cleaned_by: @user_id, last_cleaned: DateTime.now)
    end
  end
end
