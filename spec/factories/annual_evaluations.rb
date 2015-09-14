FactoryGirl.define do
  Faker::Config.locale = 'en-US'

  factory :annual_evaluation do
    created_at Time.now
    updated_at Time.now

    asia_assessment { create(:asia) }
    bladder_drainage_method { Domain::BladderDrainageMethod.cached_all.sample }
    bmi { rand(32.0) }
    completed_hub { Domain::SciHub.cached_all.sample }
    cyh { Faker::Lorem.word }
    eval_completed { Faker::Date.between(100.years.ago, Date.today) }
    eval_offered { Faker::Date.between(100.years.ago, Date.today) }
    fim { create(:fim)}
    is_inpatient { [true, false].sample }
    kurtzke_edss { create(:kurtzke_edss) }
    offered_hub { Domain::SciHub.cached_all.sample }
  end
end
