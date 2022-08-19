FactoryBot.define do
  factory :user do
    name                  {"卓郎"}
    email                 {Faker::Internet.free_email}
    password              {"r12345"}
    password_confirmation {password}
    profile               {"あああ"}
  end
end