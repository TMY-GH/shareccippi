FactoryBot.define do
  factory :user do
    nick_name               { "テス田　テス太郎" }
    user_name               { "test01" }
    password = "aaa000"
    password                { password }
    password_confirmation   { password }
  end
end
