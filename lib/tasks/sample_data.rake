namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "admin",
                         email: "parkinson@abv.bg",
                         password: "924842",
                         password_confirmation: "924842",
                         admin: true)

    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end

