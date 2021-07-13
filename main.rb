require_relative 'lib/product'
require_relative 'lib/film'
require_relative 'lib/book'
require_relative 'lib/cd_disk'

require_relative 'lib/product_collection'
require_relative 'lib/cart'

cart = Cart.new
collection = ProductCollection.from_dir("#{__dir__}/data")

collection.sort!(by: :title, order: :asc)

loop do
  puts "Что вы хотите купить ?"
  puts

  puts collection
  puts
  puts "Выход.(ENTER / 0)"
  puts
  user_input = gets.to_i

  break if user_input == 0

  chosen_product = collection.product_by_index(user_input)

  if chosen_product.amount == 0
    puts "Данный товар купить нельзя, он закончился."
    puts
    next
  end

  puts "В вашу корзину добавлено #{chosen_product} "

  chosen_product.amount -= 1

  cart.add_product(chosen_product)
  puts

  puts "Всего товаров на сумму: #{cart.total} руб."
  puts
end

if cart.empty?
  puts "Вы ничего не выбрали, приходите снова."
else
  puts "Вы купили:"
  puts
  puts cart
  puts
  puts "С Вас — #{cart.total} руб. Спасибо за покупки!"
end
