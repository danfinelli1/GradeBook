class Assignment < ApplicationRecord
  belongs_to :course
  has_many :students, through: :grades
end
