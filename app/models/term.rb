class Term < ActiveRecord::Base
  has_many :enrollments, dependent: :destroy
  has_many :students, through: :enrollments

  validates :begins_at, presence: true
  validates :ends_at, presence: true
end
