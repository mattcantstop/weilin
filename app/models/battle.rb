class Battle < ActiveRecord::Base

  belongs_to :war
  belongs_to :user

end
