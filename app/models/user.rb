class User < ActiveRecord::Base

  has_secure_password

  has_many :wars, :class_name => :participant

end
