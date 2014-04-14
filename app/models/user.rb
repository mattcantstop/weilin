class User < ActiveRecord::Base

  has_secure_password

  has_many :wars
  has_many :participants
  has_many :wars, :through => :participants

end
