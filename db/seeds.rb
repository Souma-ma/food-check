User.create!(
  nickname: "master",
  email: ENV["ADMIN_USER_EMAIL"],
  password: "abcd123",
  password_confirmation: "abcd123",
  admin: true
)