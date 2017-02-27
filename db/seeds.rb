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

					{title:"部署到Heroku,图片不显示？",
          description: "此经验由@panxiubin助教提供。初次使用aws服务的同学，在将专案部署到heroku之后，常常会遇到图片无法正常显示的问题，此经验可以有效的解决这个问题，有图有真相，灰常容易理解。",
					body: "具体请戳此logdown链接：<a href='http://yammy-blog.logdown.com/posts/1478529'>this</a> ",
					category: "heroku",
          image_path: "#{Rails.root}/app/assets/images/heroku1.jpg"},

					{title:"页面布局的高频小套路",
          description: "此经验由@raimonfuns同学提供。初次接触编程的同学，最大的痛点可能就是前端了，一个好看的网站页面可以让网站焕发出无限的魅力，此经验告诉你前端的高频小套路。",
					body: "具体请戳此全栈营论坛链接：<a href='http://forum.qzy.camp/t/topic/733'>this</a> ",
					category: "frontend",
          image_path: "#{Rails.root}/app/assets/images/frontend1.jpg"},

					{title:"如何筛选出我已投递的工作？",
          description: "此经验由@megychen同学提供。job-listing中，如果我们想让用户筛选出已经投递的工作，该怎么办呢？其实，此前rails101的教程中其实已经给出了线索，具体如何操作呢？快来看@megychen的解答。",
					body: "具体请戳此全栈营论坛链接：<a href='http://forum.qzy.camp/t/topic/457?source_topic_id=433'>this</a> ",
					category: "backend",
          image_path: "#{Rails.root}/app/assets/images/backend1.jpg"},

					{title:"两步合并rake db三兄弟命令",
          description: "此经验由@yammy同学提供。作为我们常用的三兄弟数据命令，一般来说我们需要用三次命令来完成数据的重整，此经验可以把这三个命令合并，从此本地整理数据，只需要一个命令即可快速解决问题。",
					body: "具体请戳此logdown链接：<a href='http://yammy-blog.logdown.com/posts/1478529'>this</a> ",
					category: "rails",
          image_path: "#{Rails.root}/app/assets/images/rails1.jpg"},

]




p1 = Product.create([title:products[0][:title],description:products[0][:description],body:products[0][:body],category:products[0][:category],quantity:rand(3..9) * 100 ,price:rand(1..5),image:open(products[0][:image_path])])
p2 = Product.create([title:products[1][:title],description:products[1][:description],body:products[1][:body],category:products[1][:category],quantity:rand(3..9) * 100 ,price:rand(1..5),image:open(products[1][:image_path])])
p3 = Product.create([title:products[2][:title],description:products[2][:description],body:products[2][:body],category:products[2][:category],quantity:rand(3..9) * 100 ,price:rand(1..5),image:open(products[2][:image_path])])
p4 = Product.create([title:products[3][:title],description:products[3][:description],body:products[3][:body],category:products[3][:category],quantity:rand(3..9) * 100 ,price:rand(1..5),image:open(products[3][:image_path])])


puts "Successfully create 4 skill info."
