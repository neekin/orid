class User < ApplicationRecord
  has_many :orids
  has_secure_password

  #用户token验证 seesion里面保存token
  before_create { generate_token(:auth_token) }
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column =>self[column])
  end
end
