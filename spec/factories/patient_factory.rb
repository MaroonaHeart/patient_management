# frozen_string_literal: true

FactoryBot.define do
  factory :patient do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    middle_name { Faker::Name.middle_name  }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
    gender { 'male' }
    height { Faker::Number.between(from: 100, to: 250) }
    weight { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
  end
end
