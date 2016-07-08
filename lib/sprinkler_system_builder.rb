require File.dirname(__FILE__) + '/sprinkler_system'
require File.dirname(__FILE__) + '/station'

class SprinklerSystemBuilder

  def initialize
    @sprinkler_system = SprinklerSystem.new
  end

  def sprinkler_system
    @sprinkler_system
  end

  def add_serial_port(serial_port)
    @serial_port = serial_port
  end

  def add_station(n)
    @sprinkler_system.add_station(n, @serial_port)
  end
end
