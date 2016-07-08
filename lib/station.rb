require File.dirname(__FILE__) + '/solenoid'

class Station

  def initialize(name, port)
    @name = name
    @solenoid = Solenoid.new(pin: name.to_i+1, port: port)
    @state = :off
  end

  def name
    @name
  end

  def enable
    puts "Turning on station #{name} ..."

    @solenoid.on()
    @state = :on

    return true
  end

  def disable
    puts "Turning off station #{name} ..."

    @solenoid.off()
    @state = :off

    return true
  end

  def on?
    @state == :on
  end

  def off?
    @state == :off
  end

  def <=>(station)
    @name <=> station.name
  end

end
