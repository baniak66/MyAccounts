FactoryGirl.define do
  factory :evidence do
    number "1/2016"
    madedate "01-01-2016"
    amount 100.0
    description "Description"
    accept false
    contractor_id nil
  end
end
