class Score < ActiveRecord::Base

  belongs_to :war
  belongs_to :user

  def add_win
    binding.pry
    self.tally += 1
    self.save
  end

end
