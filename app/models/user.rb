require 'digest/sha2'

class User < ActiveRecord::Base
  has_many :tweets
  attr_reader :password

  def password=(password)
    @password = password

    if password.present?
      self.hashed_password = User.generate_hash(password)
    end
  end

  def self.authenticate(username, password)
    user = find_by_username(username)
    if user.hashed_password = generate_hash(password)
      return user
    end
  end

  def self.generate_hash(password)
    Digest::SHA2.hexdigest(password)
  end

end


