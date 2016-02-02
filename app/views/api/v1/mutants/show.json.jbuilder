json.id @mutant.id
json.mutant_name @mutant.mutant_name
json.power @mutant.power
json.real_name @mutant.real_name
json.created_at @mutant.created_at
json.updated_at @mutant.updated_at
json.eligibility_begins_at @mutant.eligibility_begins_at
json.eligibility_ends_at @mutant.eligibility_ends_at
json.may_advise_beginning_at @mutant.may_advise_beginning_at

if @mutant.advisor
  json.advisor do
    json.id @mutant.advisor.id
    json.mutant_name @mutant.advisor.mutant_name
    json.power @mutant.advisor.power
    json.real_name @mutant.advisor.real_name
    json.created_at @mutant.advisor.created_at
    json.updated_at @mutant.advisor.updated_at
    json.eligibility_begins_at @mutant.advisor.eligibility_begins_at
    json.eligibility_ends_at @mutant.advisor.eligibility_ends_at
    json.may_advise_beginning_at @mutant.advisor.may_advise_beginning_at
    json.url api_v1_mutant_url(@mutant.advisor)
  end
end
