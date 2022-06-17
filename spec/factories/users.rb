FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    familyname_kanji      { person.last.kanji }
    firstname_kanji       { person.first.kanji }
    familyname_kana       { person.last.katakana }
    firstname_kana        { person.first.katakana }
    birthday              { Faker::Date.backward }
  end
end
