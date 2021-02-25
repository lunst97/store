
require_relative 'lib/marker'
require_relative 'lib/film'
require_relative 'lib/book'

require_relative 'lib/product_collection'

all = ProductCollection.from_dir("#{__dir__}/data")

all.sort!(by: :price, order: :asc)

all.to_a.each do |product|
  puts product
end