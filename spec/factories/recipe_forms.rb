FactoryBot.define do
  factory :recipe_form do
    recipe_name           { "カレーライス" }
    minute                { "1" }
    serving               { "1" }
    publish               { "1" }
    price                 { "100" }
    ingredient_ids        { ["2", "3"] }
    amounts               { ["100", "200"] }
    contents              { ["テスト調理方法", "テスト調理方法２"] }
    caution               { "注意書き" }
    difficulty            { 1 }
  end
end