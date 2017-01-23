class Student < ApplicationRecord
  has_many :courses, through: :enrollment
  has_many :assignments, through: :grades
end
