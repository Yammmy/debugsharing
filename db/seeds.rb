# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "这个seeds文件可以自动建立一个真实的admin账号和test账号"

create_account = User.create([name:'yammy', email: 'yammy7chris@gmail.com', password:'111111', password_confirmation: '111111', is_admin: 'true'])
puts "Admin account created."

create_account = User.create([name:'test', email: 'gdouxym@163.com', password:'111111', password_confirmation: '111111', is_admin: 'false'])
puts "Test account created."



products =[

					{title:"Tiered Slip dress",
          description: "Tiered asymmetrical ruffles add flounce to a midi-length dress perfect for twirling on the dance floor.",
          image_path: "#{Rails.root}/app/assets/images/dress1.jpg"},

          {title:"Ruffle A-Line Dress",
          description: "Shoulder cutouts up the edginess of this pretty floral frock that flatters with a ruffled peplum waist.",
          image_path: "#{Rails.root}/app/assets/images/dress2.jpg"},

          {title:"Drop Waist Dress ",
          description: "A mod cocktail look with a polished collar, cutout back and swingy high/low skirt.",
          image_path: "#{Rails.root}/app/assets/images/dress3.jpg"},


          {title:"Slpended Dress ",
          description: "A mod cocktail look with a polished collar, cutout back and swingy high/low skirt.",
          image_path: "#{Rails.root}/app/assets/images/dress4.jpg"},


          {title:"Awesome Dress ",
          description: "A mod cocktail look with a polished collar, cutout back and swingy high/low skirt.",
          image_path: "#{Rails.root}/app/assets/images/dress5.jpg"},

          {title:"Wonderful Dress ",
          description: "A mod cocktail look with a polished collar, cutout back and swingy high/low skirt.",
          image_path: "#{Rails.root}/app/assets/images/dress6.jpg"},

          {title:"Red curtain Dress ",
          description: "A mod cocktail look with a polished collar, cutout back and swingy high/low skirt.",
          image_path: "#{Rails.root}/app/assets/images/dress7.jpg"},

          {title:"Blue tango Dress ",
          description: "A mod cocktail look with a polished collar, cutout back and swingy high/low skirt.",
          image_path: "#{Rails.root}/app/assets/images/dress8.jpg"},

					{title:"Awesome Dress ",
          description: "A mod cocktail look with a polished collar, cutout back and swingy high/low skirt.",
          image_path: "#{Rails.root}/app/assets/images/dress13.jpg"},

          {title:"Wonderful Dress ",
          description: "A mod cocktail look with a polished collar, cutout back and swingy high/low skirt.",
          image_path: "#{Rails.root}/app/assets/images/dress14.jpg"},

          {title:"Red curtain Dress ",
          description: "A mod cocktail look with a polished collar, cutout back and swingy high/low skirt.",
          image_path: "#{Rails.root}/app/assets/images/dress15.jpg"},

          {title:"Blue tango Dress ",
          description: "A mod cocktail look with a polished collar, cutout back and swingy high/low skirt.",
          image_path: "#{Rails.root}/app/assets/images/dress16.jpg"},

]




p1 = Product.create([title:products[0][:title],description:products[0][:description],quantity:rand(3..9) * 100 ,price:rand(1..9) * 100 + 99,image:open(products[0][:image_path])])
p2 = Product.create([title:products[1][:title],description:products[1][:description],quantity:rand(3..9) * 100 ,price:rand(1..9) * 100 + 99,image:open(products[1][:image_path])])
p3 = Product.create([title:products[2][:title],description:products[2][:description],quantity:rand(3..9) * 100 ,price:rand(1..9) * 100 + 99,image:open(products[2][:image_path])])
p4 = Product.create([title:products[3][:title],description:products[3][:description],quantity:rand(3..9) * 100 ,price:rand(1..9) * 100 + 99,image:open(products[3][:image_path])])
p5 = Product.create([title:products[4][:title],description:products[4][:description],quantity:rand(3..9) * 100 ,price:rand(1..9) * 100 + 99,image:open(products[4][:image_path])])
p6 = Product.create([title:products[5][:title],description:products[5][:description],quantity:rand(3..9) * 100 ,price:rand(1..9) * 100 + 99,image:open(products[5][:image_path])])
p7 = Product.create([title:products[6][:title],description:products[6][:description],quantity:rand(3..9) * 100 ,price:rand(1..9) * 100 + 99,image:open(products[6][:image_path])])
p8 = Product.create([title:products[7][:title],description:products[7][:description],quantity:rand(3..9) * 100 ,price:rand(1..9) * 100 + 99,image:open(products[7][:image_path])])
p9 = Product.create([title:products[8][:title],description:products[8][:description],quantity:rand(3..9) * 100 ,price:rand(1..9) * 100 + 99,image:open(products[8][:image_path])])
p10 = Product.create([title:products[9][:title],description:products[9][:description],quantity:rand(3..9) * 100 ,price:rand(1..9) * 100 + 99,image:open(products[9][:image_path])])
p11 = Product.create([title:products[10][:title],description:products[10][:description],quantity:rand(3..9) * 100 ,price:rand(1..9) * 100 + 99,image:open(products[10][:image_path])])
p12 = Product.create([title:products[11][:title],description:products[11][:description],quantity:rand(3..9) * 100 ,price:rand(1..9) * 100 + 99,image:open(products[11][:image_path])])

puts "Successfully create 12 products info."
