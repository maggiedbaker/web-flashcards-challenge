require 'bcrypt'

class User < ActiveRecord::Base
  has_many :rounds
  has_many :guesses

  validates :username, :password_hash, :presence => true

  def authenticate(password)
    return false if self == nil
    self.password == password
  end

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

end

