class User < ApplicationRecord
  include Gravtastic
  # gravtastic :author_email
  gravtastic :email
  has_many :orids
  has_secure_password

  validates :username, presence: { message: "用户名不能为空"  }
  validates :username, uniqueness: { message: "用户名已存在", case_sensitive: false } #case_sensitive: false 关闭大小写不敏感
  validates :password, presence: { message: "密码不能为空" }
  validates :password, length: { minimum: 6, message: "密码长度最短为6位" }

  #用户token验证 seesion里面保存token
  before_create { generate_token(:token) }
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column =>self[column])
  end
end
