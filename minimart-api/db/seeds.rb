# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


categories = ["パン","野菜","果物","お菓子","魚"]
Category.destroy_all
5.times do |i|
  Category.create!(
    name: categories[i]
  )
end

ADVERBS = %w(とても すごく 大変 感動の 涙が出るほど)
ADJECTIVES = %w(おいしい 旨い ハラショーな 美味な 満足できる)
FOOD = %w(トマト きゅうり にんじん パスタ 生クリーム)
def random_description(food)
  "#{ADVERBS.sample}#{ADJECTIVES.sample}#{food}"
end

Product.destroy_all
30.times do |i|
  food = FOOD.sample
  Product.create!(
    name: "#{food}#{i+1}",
    description: random_description(food),
    price: 50 * (i+1),
    category_id: rand(1...6),
    image_path: "/images/products/#{(i%80)+1}.jpg",
  )
end

PickupLocation.destroy_all
PickupLocation.create!(name: "WeWork みなとみらい")
%w(
  ドコカラナイス
  エイトテン
).each do |location_name|
  5.times do |i|
    PickupLocation.create!(name: "#{location_name}#{i}")
  end
end

User.destroy_all
User.create!(
  name: "toma-to",
  pickup_location_id: 1,
)
