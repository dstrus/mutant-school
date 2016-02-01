json.array!(@terms) do |term|
  json.extract! term, :id, :begins_at, :ends_at
  json.url term_url(term, format: :json)
end
