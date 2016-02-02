class Enrollment < ActiveRecord::Base
  belongs_to :student, class_name: 'Mutant', foreign_key: 'mutant_id'
  belongs_to :term

  validates :mutant_id, presence: true
  validates :term_id, presence: true
  validate :student_has_an_eligibility_period
  validate :student_is_eligible

  private

  def student_has_an_eligibility_period
    if !student.eligibility_defined?
      errors.add :student, 'has invalid eligibility dates'
    end
  end

  def student_is_eligible
    if student.eligibility_begins_at.present? && term.begins_at < student.eligibility_begins_at
      errors.add :student, 'is not eligible for that term'
    end
  end
end
