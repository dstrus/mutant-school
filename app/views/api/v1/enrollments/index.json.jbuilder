json.array!(@enrollments) do |enrollment|
  json.id enrollment.id
  json.student do
    json.id enrollment.student.id
    json.mutant_name enrollment.student.mutant_name
    json.power enrollment.student.power
    json.real_name enrollment.student.real_name
    json.eligibility_begins_at enrollment.student.eligibility_begins_at
    json.eligibility_ends_at enrollment.student.eligibility_ends_at
    json.may_advise_beginning_at enrollment.student.may_advise_beginning_at
    json.url api_v1_mutant_url(enrollment.student)
  end
  json.term enrollment.term, :id, :begins_at, :ends_at
  json.created_at enrollment.created_at
  json.updated_at enrollment.updated_at
  json.url api_v1_mutant_enrollment_url(enrollment.student, enrollment)
end
