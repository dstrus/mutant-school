json.array!(@advisees) do |mutant|
  json.extract!(
    mutant,
    :id,
    :mutant_name,
    :power,
    :real_name,
    :eligibility_begins_at,
    :eligibility_ends_at,
    :may_advise_beginning_at
  )
  json.url api_v1_mutant_url(mutant)
end
