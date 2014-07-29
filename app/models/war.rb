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

end
