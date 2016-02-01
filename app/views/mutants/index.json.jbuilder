json.array!(@mutants) do |mutant|
  json.extract! mutant, :id, :mutant_name, :power, :real_name
  json.url mutant_url(mutant, format: :json)
end
