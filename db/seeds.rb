# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env == 'development'


Tag.create([
  {name: '激安' },
  {name: '危険' },
  {name: '治安' },
  {name: '宿' },
  {name: 'ビザ' },
  {name: 'ルート' },
  {name: '持ち物'},
  {name: '絶景'},
  {name: '絶品'},
  {name: '裏技'}
])
end
