namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
      puts "Resetando DB"
      %x(rails db:drop db:create db:migrate)

      kinds = %w(Amigo Comercial Conhecido) 
      
      kinds.each do |kind|
        Kind.create!(description: kind)
      end
      100.times do |i|
        Contact.create!(
          name: Faker::Name.name,
          email: Faker::Internet.email,
          birthdate: Faker::Date.birthday(18, 65),
          kind: Kind.all.sample
        )
      end
      puts "Contatos e tipos criados"

      Contact.all.each do |contact|
        Random.rand(5).times do
         phone = Phone.create!(number: Faker::PhoneNumber.phone_number)
         contact.phones << phone
         contact.save!
        end
      end
      puts "Telefones criados"  

      Contact.all.each do |contact|
         address = Address.create!(street: Faker::Address.street_address, 
                                  city: Faker::Address.city, 
                                  contact: contact)
      end
      puts "Endereços criados"
      
  end
end
