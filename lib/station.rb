class Station

  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def enable
    puts "Turning on station #{name} ..."
    return true
  end

  def disable
    puts "Turning off station #{name} ..."
    return true
  end

end
