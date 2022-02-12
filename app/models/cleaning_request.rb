class CleaningRequest < ApplicationRecord
  belongs_to :user

  after_commit :generate_report, on: :update

  def generate_report
    if self.completed?
      GenerateCleaningReport.call(self.title, self.description, self.room_ids, self.user_id)
    end
  end
end
