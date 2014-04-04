FactoryGirl.define do
  factory :war do
    name "Ping Pong"
    has_end true
    ending_date nil
    ending_score 11
    open_registration false
    is_private false
    prize "A High Five"
    association :owner_id, factory: :user
  end
end
