# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

1.upto(10) do |i|
  Article.create({
    title: "Article - #{i}",
    body:  "Article Body Text #{i}"
  })
end

Article.create({
  title: "Article with Image",
  body:  "Article Body Text",
  image: File.open(Rails.root.join('spec', 'fixtures', 'test.png'))
})
User.create!(email: 'test@avarteq.de', password: 'test1234', password_confirmation: 'test1234', confirmed_at: Date.today)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
