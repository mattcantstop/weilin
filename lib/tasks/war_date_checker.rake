desc "Checks all wars to ensure they have not ended at midnight UTC"
task :completion_check => :environment do
  War.all.each do |war|
    if war.is_active? && war.has_end && !war.ending_date.nil?
      war.check_for_time_end
    end
  end
end
