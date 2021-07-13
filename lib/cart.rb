class Cart
  def initialize(products = [])
    @products = products
  end

  # складывает все в корзину
  def add_product(chosen_product)
    @products << chosen_product
  end

  def total
    @products.sum { |product| product.price }
  end

  # выводит всю корзину
  def to_s
    @products.join("\n")
  end

  def empty?
    @products.empty?
  end
end
