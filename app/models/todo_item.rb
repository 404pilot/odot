class TodoItem < ActiveRecord::Base
  validates :content, presence: true, length: { minimum: 2 }

  belongs_to :todo_list

  scope :complete, -> { where("completed_at is not null") }
  scope :incomplete, -> { where(completed_at: nil) }

  def completed?
    !self.completed_at.blank?
  end
end
