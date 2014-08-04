class War < ActiveRecord::Base

  has_many :participants
  has_many :users, :through => :participants
  has_many :battles
  has_many :scores

  def check_for_completion(current_user, score)
    score = Score.where(:war_id => self.id, :user_id => current_user.id)
    if self.ending_score == score.first.tally
      self.mark_as_complete
      self.assign_winner(current_user)
      self.save
      return true
    else
      return false
    end
  end

  def mark_as_complete
    self.is_complete = true
  end

  def assign_winner(current_user)
    self.winner_id = current_user.id
  end

  def is_active?
    return true if self.is_disabled == true && self.is_complete == false
  end

  def check_for_time_end
    day_war_ends = self.ending_date
    if Time.now.utc >= day_war_ends
      self.mark_as_complete
      self.calculate_winner_by_wins
    end
  end

  def calculate_winner_by_wins
    array_of_all_tallies = self.scores.map { |score| score[:tally] }
    winning_tally = array_of_all_tallies.max
    winner = self.scores.find_by_tally(winning_tally)
    assign_winner(winner)
  end

end
