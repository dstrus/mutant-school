json.array!(@enrollments) do |enrollment|
  json.id enrollment.id
  json.student enrollment.student,
    :id,
    :mutant_name,
    :power,
    :real_name,
    :eligibility_begins_at,
    :eligibility_ends_at,
    :may_advise_beginning_at
  json.term enrollment.term, :id, :begins_at, :ends_at
  json.created_at enrollment.created_at
  json.updated_at enrollment.updated_at
  json.url api_v1_mutant_enrollment_url(enrollment.student, enrollment)
end
