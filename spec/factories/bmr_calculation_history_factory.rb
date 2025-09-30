# frozen_string_literal: true

FactoryBot.define do
  factory :bmr_calculation_history do
    association :patient

    formula { 'mifflin' }
    result { Faker::Number.decimal(l_digits: 5, r_digits: 3) }
  end
end
