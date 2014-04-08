class War < ActiveRecord::Base

  has_many :battles
  belongs_to :user, :foreign_key => :owner_id
  validates_presence_of :owner_id

end
