class Request < ApplicationRecord
  validates :body, presence: true, length: { minimum: 1, maximum: 75 }
  belongs_to :book
  belongs_to :user
  validates :user_id, uniqueness: { scope: :book_id }
  validate :weekly_request_limit

  def weekly_request_limit
    if Request.where(user_id: user_id).where("created_at > ?", 1.week.ago).count >= 7
      errors.add(:user_id, "cannot Request for more than 7 books per week")
    end
  end
end
