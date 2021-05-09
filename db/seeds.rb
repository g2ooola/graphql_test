# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def rebuild
  Book.destroy_all
  Store.destroy_all
  User.destroy_all
  Admin.destroy_all

  1...3.times do |i|
    User.create!(
      name: "user#{i}",
      email: "user#{i}@email.com",
      tel: "09#{rand(100_000...999_999)}"
    )
  end

  1...5.times do |i|
    Store.create!(
      name: "store#{i}"
    )
  end

  user_ids = User.pluck(:id)
  store_ids = Store.pluck(:id)

  1...15.times do |i|
    Book.create!(
      name: "book#{i}",
      publication_date: '2021-01-01'.to_date + rand(60).days,
      user_id: user_ids.sample,
      store_id: store_ids.sample)
  end

  1.times do |i|
    Admin.create(
      email: 'admin@email.com')
  end

end

rebuild()
