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

  # Выводит список всех продуктов
  puts collection
  puts
  puts "Выход.(ENTER / 0)"
  puts
  # Пользователь вводит продукт по номеру.
  user_input = gets.to_i

  # Программа заканчивает работать, потому что пользователь нажал "Выйти"
  break if user_input == 0

  # Проверяет товар по наличию
  chosen_product = collection.product_by_index(user_input)

  # если товара нет (0) то выводит на экран придупреждение
  if chosen_product.amount == 0
    puts "Данный товар купить нельзя, он закончился."
    puts
    next
  end

  # Выводит продукт, который пользователь выбрал на покупку.
  puts "В вашу корзину добавлено #{chosen_product} "

  # Вычитаем кол-во на складе
  chosen_product.amount -= 1

  # Отправляем в метод, что пользователь выбрал, чтобы закинуть в корзину.
  cart.add_product(chosen_product)
  puts

  # Выводим сумму на которую пользователь выбрал товаров, а так же отправляем методу сумму товара, чтобы тот сложил его в общую.
  puts "Всего товаров на сумму: #{cart.total} руб."
  puts
end

if cart.empty?
  puts "Вы ничего не выбрали, приходите снова."
else
  puts "Вы купили:"
  puts
  # Выводим все товары из корзины
  puts cart
  puts
  # Выводим полную сумму, на которую пользователь набрал.
  puts "С Вас — #{cart.total} руб. Спасибо за покупки!"
end
