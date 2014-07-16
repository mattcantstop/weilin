class User < ActiveRecord::Base

  has_secure_password

  has_many :wars
  has_many :participants
  has_many :wars, :through => :participants
  has_many :scores

  before_create :generate_token

  private

  def generate_token
    self.token = SecureRandom.uuid
  end

end
