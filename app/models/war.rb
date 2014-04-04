class War < ActiveRecord::Base

  belongs_to :user, :foreign_key => :owner_id
  validates_presence_of :owner_id

end
