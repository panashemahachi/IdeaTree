json.array!(@branches) do |branch|
  json.extract! branch, :id, :branch_name, :branch_description, :idea_id, :user_id
  json.url branch_url(branch, format: :json)
end
