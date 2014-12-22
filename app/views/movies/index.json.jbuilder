json.array!(@movies) do |movie|
  json.extract! movie, :id, :title, :description, :movie_length, :director, :rating, :user_id
  json.url movie_url(movie, format: :json)
end
