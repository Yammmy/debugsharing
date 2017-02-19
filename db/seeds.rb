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

					{title:"7步给你的商品添加分类",
          description: "Hi, http://yammy-blog.logdown.com/posts/1425716",
					category: "rails",
          image_path: "#{Rails.root}/app/assets/images/dress1.jpg"},

					{title:"10步学会laravel",
          description: "Hi, http://yammy-blog.logdown.com/posts/1425716",
					category: "laravel",
          image_path: "#{Rails.root}/app/assets/images/dress2.jpg"},

					{title:"10步学会ruby",
          description: "Hi, http://yammy-blog.logdown.com/posts/1425716",
					category: "ruby",
          image_path: "#{Rails.root}/app/assets/images/dress3.jpg"},

					{title:"10步学会python",
          description: "Hi, http://yammy-blog.logdown.com/posts/1425716",
					category: "python",
          image_path: "#{Rails.root}/app/assets/images/dress4.jpg"},

]




p1 = Product.create([title:products[0][:title],description:products[0][:description],category:products[0][:category],quantity:rand(3..9) * 100 ,price:rand(0..10),image:open(products[0][:image_path])])
p2 = Product.create([title:products[1][:title],description:products[1][:description],category:products[1][:category],quantity:rand(3..9) * 100 ,price:rand(0..10),image:open(products[1][:image_path])])
p3 = Product.create([title:products[2][:title],description:products[2][:description],category:products[2][:category],quantity:rand(3..9) * 100 ,price:rand(0..10),image:open(products[2][:image_path])])
p4 = Product.create([title:products[3][:title],description:products[3][:description],category:products[3][:category],quantity:rand(3..9) * 100 ,price:rand(0..10),image:open(products[3][:image_path])])


puts "Successfully create 4 skill info."
