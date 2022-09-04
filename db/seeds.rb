# Заполням таблицу пользователей
users = []
2.times do |index|
  ## c проверкой на уникальность
  User.find_or_create_by(name: "User#{index}") do |user|
    user.password = "pass#{index}"
    users.push(user)
  end
end

# Заполням таблицу сообщений
even = false
10.times do |index|
  ## равномерно по каждому отправителю
  Message.create({ user: even ? users.first : users.last, content: "сообщение #{index}" })
  even = !even
end
