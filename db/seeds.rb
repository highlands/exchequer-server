# rubocop:disable Rails/Output
puts 'Creating a Manager'
manager = Manager.create!(name: 'Generated Manager')

puts 'Creating an Api Key'
ApiKey.create!(manager: manager)

puts 'Creating an Offer'
Offer.create!(manager: manager, name: 'Offer', description: 'Description', amount: 200, deferrable: true)
