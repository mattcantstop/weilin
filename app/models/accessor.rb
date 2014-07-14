class Accessor < ActiveRecord::Base
  require "digest/sha1"

  def generate(length = 20)
    api_key = Digest::SHA1.hexdigest(Time.now.to_s + rand(12341234).to_s)[1..length]
    return api_key
  end

end
