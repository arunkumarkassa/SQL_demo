class Student < ApplicationRecord
  has_many :marks, dependent: :destroy
  validates :name, :rollnumber, :standard, :date_of_birth, presence: true
end
