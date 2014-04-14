class War < ActiveRecord::Base

  has_many :users_wars
  has_many :users, :through => :users_wars
  has_many :battles
  validates_presence_of :owner_id

end
