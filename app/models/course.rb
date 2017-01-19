class Course < ApplicationRecord
  has_many :students, through: :enrollment
  has_many :assignments
  belongs_to :teacher
end
