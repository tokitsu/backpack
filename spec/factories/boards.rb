FactoryBot.define do
  factory :board do
    title { 'テストを書く'}
    body {'ノートの中身を書く。'}
    user
  end
end
