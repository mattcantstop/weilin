class War < ActiveRecord::Base

  has_many :battles
  has_many :participants
  has_many :users, :through => :participants
  belongs_to :user, :foreign_key => :owner_id
  validates_presence_of :owner_id

end
