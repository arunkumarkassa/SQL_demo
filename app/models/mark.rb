class Mark < ApplicationRecord
  belongs_to :student
  validates :subject, :score, :grade, :student_id, presence: true
end
