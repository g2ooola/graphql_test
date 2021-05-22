# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def clear_db
  Admin.destroy_all
  Book.destroy_all
  Store.destroy_all
  User.destroy_all
end

def create_data
  1...3.times do |i|
    User.create!(
      name: "user#{i}",
      email: "user#{i}@email.com",
      tel: "09#{rand(100_000...999_999)}"
    )
  end

  1...5.times do |i|
    Store.create!(
      name: "store#{i}",
      grade: [:general, :good, :best].sample
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

  User.all.each do |user|
    Coupon.create!(
      user: user,
      name: "coupon-#{user.id}",
      discount: rand(1..10))
  end

  1.times do |i|
    Admin.create(
      email: 'admin@email.com')
  end
end

def fack_data
  u = User.first
  u.update(secret: '1234567890')

  a = Admin.first
  a.update(secret: '1234567890')
end

def rebuild
  clear_db()
  create_data()
  fack_data()
  

end

rebuild()
