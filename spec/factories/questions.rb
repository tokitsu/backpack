FactoryBot.define do
  factory :question do
    title { '質問の題'}
    body {'質問の内容'}
    user
  end
end
