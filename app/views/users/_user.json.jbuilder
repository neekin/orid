json.extract! user, :id, :username, :password_digest, :email, :avater, :nickname, :gender, :created_at, :updated_at
json.url user_url(user, format: :json)
