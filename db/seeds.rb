puts "Criando Administrador"
User.create!(name: 'Fabricio Bonjorno', email: 'admin@admin.com', password: '123456',
password_confirmation: '123456', profile: true)

puts "Criando Fabricantes"
10.times do
  Manufacturer.create!(
    description: Faker::Company.name
  )
end

puts "Criando Grupos"
10.times do
  Group.create!(
    description: Faker::Commerce.material,
    manufacturer_id: rand(1..10)
  )
end

puts "Criando Familias"
10.times do
  Family.create!(
    description: Faker::Commerce.color,
    group_id: rand(1..10)
  )
end

puts "Criando NCM"
10.times do
  TaxClassification.create!(
    description: Faker::Commerce.promotion_code
  )
end

puts "Criando Produtos"
10.times do
  Product.create!(
    description: Faker::Commerce.material,
    family_id: rand(1..10),
    code: rand(1..100),
    ean: rand(100..200),
    dun: rand(200..300),
    display: rand(400..500)
  )
end