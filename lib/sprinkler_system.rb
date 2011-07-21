require File.dirname(__FILE__) + '/station'

class SprinklerSystem

  def initialize
    @stations = {}
  end

  def add_station(n)
    @stations[n] = Station.new(n)
  end

  def enable(n)
    return @stations[n].enable
  end

  def disable_all
    @stations.each_pair {|key, value| value.disable}
    return true
  end
  
end
