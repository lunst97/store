class CdDisk < Product
  attr_accessor :title, :executor, :genre, :year

  def initialize(params)
    super

    @title = params[:title]
    @executor = params[:executor]
    @genre = params[:genre]
    @year = params[:year]
  end

  def self.from_file(file_path)
    lines = File.readlines(file_path).map { |l| l.chomp }

    self.new(
      title: lines[0],
      executor: lines[1],
      genre: lines[2],
      year: lines[3].to_i,
      price: lines[4].to_i,
      amount: lines[5].to_i
    )
  end

  def to_s
    "Альбом «#{@title}», #{@executor}, #{@genre}, #{@year}, #{@price} руб. (осталось #{@amount})"
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @executor = params[:executor] if params[:executor]
    @genre = params[:genre] if params[:genre]
    @year = params[:year] if params[:year]
  end
end
