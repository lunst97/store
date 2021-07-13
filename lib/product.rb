class Product
  # создает аксессор на ввод и вывод
  attr_accessor :amount, :price

  def initialize(params)
    @amount = params[:amount]
    @price = params[:price]
  end

  # выводит цену и кол-во во всех "детях" класса
  def to_s
    " #{@price} руб. (осталось #{@amount})"
  end

  # дает возможность обновить данные
  def update(params)
    @amount = params[:amount] if params[:amount]
    @price = params[:price] if params[:price]
  end

  # выводит ошибку если находит файл
  def self.from_file(file_path)
    raise NotImplementedError
  end
end
