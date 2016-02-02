json.array!(@terms) do |term|
  json.extract! term, :id, :begins_at, :ends_at
  json.url api_v1_term_url(term)
end
