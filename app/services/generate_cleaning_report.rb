class GenerateCleaningReport < ApplicationService
  attr_reader :room_ids, :user_id

  def initialize(title, description, room_ids, user_id)
    @title = title
    @description = description + "\n This report was generated automatically by cleaning request."
    @room_ids = room_ids
    @user_id = user_id
  end

  def call
    CleaningReport.create(title: @title, description: @description, user_id: @user_id, room_ids: @room_ids)
  end
end
