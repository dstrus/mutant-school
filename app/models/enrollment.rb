class Enrollment < ActiveRecord::Base
  belongs_to :student, class_name: 'Mutant', foreign_key: 'mutant_id'
  belongs_to :term
end
