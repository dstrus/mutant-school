class Mutant < ActiveRecord::Base
  has_many :enrollments, dependent: :destroy
  has_many :terms, through: :enrollments
  belongs_to :advisor, class_name: 'Mutant'
  has_many :advisees, class_name: 'Mutant', foreign_key: 'advisor_id', dependent: :nullify

  validates :real_name, presence: true, length: { maximum: 200 }
  validates :mutant_name, presence: true, length: { maximum: 200 }
  validates :power, presence: true, length: { maximum: 200 }
  validate :eligibility_date_compatibility

  def eligibility_defined?
    eligibility_begins_at.present? && eligibility_ends_at.present?
  end

  private

  def eligibility_date_compatibility
    if eligibility_defined? && eligibility_ends_at < eligibility_begins_at
      errors.add :eligibility_ends_at, 'is before the eligibility start date'
    end
  end
end
