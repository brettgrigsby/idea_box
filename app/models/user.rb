class User < ActiveRecord::Base
  validates :name, presence: true
  has_secure_password

  enum role: %w(default admin)
end
