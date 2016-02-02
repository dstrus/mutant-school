class Mutant < ActiveRecord::Base
  has_many :enrollments, dependent: :destroy
  has_many :terms, through: :enrollments
  belongs_to :advisor, class_name: 'Mutant'
  has_many :advisees, class_name: 'Mutant', foreign_key: 'advisor_id', dependent: :nullify
end
