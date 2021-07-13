class Product
  attr_accessor :amount, :price

  def initialize(params)
    @amount = params[:amount]
    @price = params[:price]
  end

  def to_s
    " #{@price} руб. (осталось #{@amount})"
  end

  def update(params)
    @amount = params[:amount] if params[:amount]
    @price = params[:price] if params[:price]
  end

  def self.from_file(file_path)
    raise NotImplementedError
  end
end
