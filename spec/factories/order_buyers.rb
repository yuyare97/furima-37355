FactoryBot.define do
    factory :order_buyer do
      token            { 'aaaa' }
      postcode         { '123-4567' }
      prefecture_id    { 2 }
      city             { '横浜市緑区' }
      address          { '青山1-1' }
      phone_number     { '09011112222' }
      apartment_name   { '柳ビル103' }
    end
end
