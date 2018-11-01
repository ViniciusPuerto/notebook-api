namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
      100.times do |i|
        Contact.create!(
          name: Faker::Name.name,
          email: Faker::Internet.email,
          birthdate: Faker::Date.birthday(18, 65)
        )
      end
  end

end
