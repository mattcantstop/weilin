class Score < ActiveRecord::Base

  def add_win
    self.tally += 1
  end
end
