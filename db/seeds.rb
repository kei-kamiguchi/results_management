5.times do |n|
  name = Faker::Name.name
  email = "admin#{n}@sample.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               admin: 1
               )
end
10.times do |n|
  name = Faker::Name.name
  email = "user#{n}@sample.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               )
end
  def time_diff_str(second)
    hours, rest = second.divmod(60 * 60)
    minutes, rest = rest.divmod(60)

    '%02d' % hours + ':' '%02d' % minutes
  end

500.times do |n|
  date = Date.today - n
  year = date.year
  month = date.month
  day = date.day
  in_at = DateTime.new(year, month, day, 11, 30, 45)
  out_at = DateTime.new(year, month, day, 13, 15, 20)
  TimeCard.create!(year: year, month: month, day: day, in_at: in_at, out_at: out_at, user_id: User.where(admin: false).order("RANDOM()").first.id, )
end
500.times do |n|
  date = Date.today + n
  year = date.year
  month = date.month
  day = date.day
  in_at = DateTime.new(year, month, day, 11, 30, 45)
  out_at = DateTime.new(year, month, day, 13, 15, 20)
  TimeCard.create!(year: year, month: month, day: day, in_at: in_at, out_at: out_at, user_id: User.where(admin: false).order("RANDOM()").first.id, )
end
TimeCard.all.order(in_at: :asc).each_with_index do |time_card, index|
  WorkResult.create!(writing: index+1, revision: index+2, time_card_id: time_card.id, user_id: time_card.user.id)
end
