class Item

  attr_accessor :name, :weight


  def initialize(name,weight)
    @name = name
    @weight = weight.to_i
  end

end