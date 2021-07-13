class ProductCollection
  PRODUCT_TYPES = {
    film: { dir: 'films', class: Film },
    book: { dir: 'books', class: Book },
    cd: { dir: 'cd_disks', class: CdDisk}
  }

  def initialize(products = [], basket = [], sum = 0)
    @products = products
    @basket = basket
    @sum = sum
  end

  # считывает все файлы и по по конструктору выстраивает все в хэш
  def self.from_dir(dir_path)
    products = []

    PRODUCT_TYPES.each do |type, hash|
      product_dir = hash[:dir]
      product_class = hash[:class]

      Dir["#{dir_path}/#{product_dir}/*.txt"].each do |path|
        products << product_class.from_file(path)
      end
    end

    # констуктор
    self.new(products)
  end

  # вывод полного списка продуктов
  def to_s
    product =
      @products.map.with_index(1) { |product, index| "#{index}. #{product}" }
    product.join("\n")
  end

  def to_a
    @products
  end

  # Выбирает продукт по индексу всех продкутов
  def product_by_index(user_inputs)
    to_a[user_inputs - 1]
  end

  # Сортирует весь список продуктов по ключу :by
  def sort!(params)
    case params[:by]
    when :title
      @products.sort_by! { |product| product.to_s }
    when :price
      @products.sort_by! { |product| product.price }
    when :amount
      @products.sort_by! { |product| product.amount }
    end

    # Меняет сортировку в обратное направление (по цене например)
    @products.reverse! if params[:order] == :asc

    self
  end
end
