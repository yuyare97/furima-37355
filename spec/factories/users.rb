FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'aaa111'}
    password_confirmation {password}
    last_name             {'青山'}
    first_name            {'太郎'}
    last_name_kana        {'アオヤマ'}
    first_name_kana       {'タロウ'}
    birthday              {'1930-01-01'}
  end
end