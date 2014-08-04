class Score < ActiveRecord::Base

  belongs_to :war
  belongs_to :user

  def add_win
    self.tally += 1
    self.save
  end

end
