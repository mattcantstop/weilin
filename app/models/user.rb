class User < ActiveRecord::Base

  has_secure_password

  has_many :users_wars
  has_many :wars

end
