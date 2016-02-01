class Mutant < ActiveRecord::Base
  has_many :enrollments
  has_many :semesters, through: :enrollments
  belongs_to :advisor, class_name: 'Mutant'
  has_many :advisees, class_name: 'Mutant', foreign_key: 'advisor_id'
end
