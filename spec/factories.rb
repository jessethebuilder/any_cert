FactoryGirl.define do
  sequence(:name){ |n| "name#{n}" }

  factory :certificate do
    rnd = Random.rand(0..1)
    if rnd == 1
      amount Random.rand(0.0..10000.0)
    else
      ignore do
        add_service true
      end

      service_count Random.rand(0..1000)
    end

    after(:build) do |c, e|
      if e.add_service
        c.service = build(:service)
      end
    end
  end

  factory :service do
    name
  end
end