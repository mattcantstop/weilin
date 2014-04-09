class User < ActiveRecord::Base

  has_secure_password

  has_many :wars
  belongs_to :war, through: :participants

end
