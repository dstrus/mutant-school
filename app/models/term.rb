class Term < ActiveRecord::Base
  has_many :enrollments, dependent: :destroy
  has_many :students, through: :enrollments
end
