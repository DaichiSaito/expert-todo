FactoryBot.define do
  factory :task do
    content "My Content"
    description "My Description"
    deadline "2017-09-25 07:53:24"
    user
    is_done false
  end
end
