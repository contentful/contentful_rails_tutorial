json.array!(@contentful_users) do |contentful_user|
  json.extract! contentful_user, :id, :name, :space_id, :access_token, :content_type
  json.url contentful_user_url(contentful_user, format: :json)
end
