puts "Criando Administrador"
User.create!(:name => "Fabricio Bonjorno", :email => "admin@admin.com", :password => "123456",
             :password_confirmation => "123456", :profile => true)

puts "Criando Empresa"
Company.create!(
  :social_name => "Empresa Teste",
  :fantasy_name => "Minha Empresa",
  :cnpj => "13.614.126/0001-19",
  :ie => "123.354.22-25",
  :street => "Rua sem nome",
  :number => "23-b",
  :complement => "quadra 08",
  :district => "Centro",
  :zip_code => "78151-199",
  :city => "Cuiabá",
  :state => "Mato Grosso",
  :phone => "(65) 3053-0000",
  :cell_phone => "(65) 98465-5547",
  :email => "example@meusite.com",
  :site => "www.meusite.com",
)

if Rails.env.development?
  puts "Criando Fabricantes"
  10.times do
    Manufacturer.create!(
      :description => Faker::Company.name,
    )
  end

  puts "Criando Grupos"
  10.times do
    Group.create!(
      :description => Faker::Food.fruits,
      :manufacturer_id => rand(1..10),
    )
  end

  puts "Criando Familias"
  10.times do
    Family.create!(
      :description => Faker::Name.name,
      :group_id => rand(1..10),
    )
  end

  puts "Criando NCM"
  10.times do
    TaxClassification.create!(
      :description => Faker::Commerce.promotion_code,
    )
  end

  puts "Criando Produtos"
  10.times do
    Product.create!(
      :description => Faker::Commerce.material,
      :family_id => rand(1..10),
      :tax_classification_id => rand(1..10),
      :code => rand(1..100),
      :ean => rand(100..200),
      :dun => rand(200..300),
      :display => rand(400..500),
    )
  end

end

