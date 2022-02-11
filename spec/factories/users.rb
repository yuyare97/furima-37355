FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.first_name }
    email                 { Faker::Internet.free_email }
    password              { '1Aa' + Faker::Internet.password(min_length: 6, mix_case: true) }
    password_confirmation {password}
    last_name             {'青山'}
    first_name            {'太郎'}
    last_name_kana        {'アオヤマ'}
    first_name_kana       {'タロウ'}
    birthday              { Faker::Date.birthday(min_age: 12, max_age: 70) }
  end
end