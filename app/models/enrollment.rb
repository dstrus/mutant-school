class Enrollment < ActiveRecord::Base
  belongs_to :mutant
  belongs_to :term
end
