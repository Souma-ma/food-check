User.create!(
  nickname: "master",
  email: ENV["ADMIN_USER_EMAIL"],
  password: ENV["ADMIN_USER_PASSWORD"],
  password_confirmation: ENV["ADMIN_USER_PASSWORD_CONFIRMATION"],
  admin: true
)