# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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

					{
					title:"實作carrierwave上傳多個圖片",
					description: "此经验由@YY老师提供，单张图片对购物网站来说已经没法满足要求了，此教程可以快速帮你实现多张图片上传功能。",
					body: "具体请戳此鏈接跳转<a href='http://yy4ever.logdown.com/posts/1069287' target='_blank'>logdown</a >。如果觉得这篇教程有用，欢迎扫下方二维码打赏。",
					category: "rails",
				 },

					{
					title:"部署到Heroku,图片不显示？",
          description: "此经验由@panxiubin助教提供。初次使用aws服务的同学，在将专案部署到heroku之后，常常会遇到图片无法正常显示的问题，此经验可以有效的解决这个问题，有图有真相，灰常容易理解。",
					body: "具体请戳此鏈接跳转<a href='http://panxiubin-blog.logdown.com/posts/1450745-posts-239-jdstore-deployed-to-heroku' target='_blank'>logdown</a >。如果觉得这篇教程有用，欢迎扫下方二维码打赏。",
					category: "heroku",
				 },

					{
					title:"页面布局的高频小套路",
          description: "此经验由@raimonfuns同学提供。初次接触编程的同学，最大的痛点可能就是前端了，一个好看的网站页面可以让网站焕发出无限的魅力，此经验告诉你前端的高频小套路。",
					body: "具体请戳此鏈接跳转<a href='http://forum.qzy.camp/t/topic/457/2' target='_blank'>全栈营论坛</a >。如果觉得这篇教程有用，欢迎扫下方二维码打赏。",
					category: "frontend",
				},

					{
					title:"如何筛选出我已投递的工作？",
          description: "此经验由@megychen同学提供。job-listing中，如果我们想让用户筛选出已经投递的工作，该怎么办呢？其实，此前rails101的教程中其实已经给出了线索，具体如何操作呢？快来看@megychen的解答。",
					body: "具体请戳此鏈接跳转<a href='http://forum.qzy.camp/t/topic/733' target='_blank'>全栈营论坛</a >。如果觉得这篇教程有用，欢迎扫下方二维码打赏。",
					category: "backend",
				},

					{
					title:"两步合并rake db三兄弟命令",
          description: "此经验由@yammy同学提供。作为我们常用的三兄弟数据命令，一般来说我们需要用三次命令来完成数据的重整，此经验可以把这三个命令合并，从此本地整理数据，只需要一个命令即可快速解决问题。",
					body: "具体请戳此鏈接跳转<a href='http://yammy-blog.logdown.com/posts/1478529' target='_blank'>logdown</a >。如果觉得这篇教程有用，欢迎扫下方二维码打赏。",
					category: "rails",
				},

]


products_creating = for i in 0..4 do
									    Product.create!([
												title: products[i][:title],
									     	description: products[i][:description],
												body:products[i][:body],
												category:products[i][:category],
												quantity:rand(3..9) * 100 ,
												price:1 ,
											])
 										end

puts "5 products without pics created."

photos = [
						"#{Rails.root}/app/assets/images/rails2.jpg",
						"#{Rails.root}/app/assets/images/heroku1.jpg",
						"#{Rails.root}/app/assets/images/frontend1.jpg",
						"#{Rails.root}/app/assets/images/backend1.jpg",
						"#{Rails.root}/app/assets/images/rails1.jpg"
				]


Photo.create!(product_id:1,avatar: open(photos[0]))
Photo.create!(product_id:1,avatar: open("#{Rails.root}/app/assets/images/pay.pic"))

Photo.create!(product_id:2,avatar: open(photos[1]))
Photo.create!(product_id:2,avatar: open("#{Rails.root}/app/assets/images/pay.pic"))

Photo.create!(product_id:3,avatar: open(photos[2]))
Photo.create!(product_id:3,avatar: open("#{Rails.root}/app/assets/images/pay.pic"))

Photo.create!(product_id:4,avatar: open(photos[3]))
Photo.create!(product_id:4,avatar: open("#{Rails.root}/app/assets/images/pay.pic"))

Photo.create!(product_id:5,avatar: open(photos[4]))
Photo.create!(product_id:5,avatar: open("#{Rails.root}/app/assets/images/pay.pic"))

puts "5 photos created."
