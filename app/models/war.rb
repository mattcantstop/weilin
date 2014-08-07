class War < ActiveRecord::Base

  has_many :participants
  has_many :users, :through => :participants
  has_many :battles
  has_many :scores

  def check_for_completion(current_user, score)
    score = Score.where(:war_id => self.id, :user_id => current_user.id)
    if self.ending_score == score.first.tally
      self.mark_as_complete
      self.assign_winner(current_user.id)
      self.save
      return true
    else
      return false
    end
  end

  def mark_as_complete
    self.is_complete = true
    self.save
  end

  def assign_winner(current_user_id)
    self.winner_id = current_user_id
    self.save
  end

  def is_active?
    if self.is_disabled == false && self.is_complete == false
      return true
    else
      return false
    end
  end

  def check_for_time_end
    day_war_ends = self.ending_date
    if Time.now.utc >= day_war_ends
      puts "Closing out a war"
      self.mark_as_complete
      self.calculate_winner_by_wins if !self.scores.blank?
    end
  end

  def calculate_winner_by_wins
    array_of_all_tallies_with_user_id = self.scores.map { |score| [score[:tally], score[:user_id]] }
    winning_tally_with_user_id = array_of_all_tallies_with_user_id.max
    puts "#{winning_tally_with_user_id.inspect}"
    assign_winner(winning_tally_with_user_id[1])
  end

end
