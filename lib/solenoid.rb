require File.dirname(__FILE__) + '/serial_port_control'

class Solenoid

  def initialize(args={})
    @pin = args.fetch(:pin)
    @port = args.fetch(:port)
  end

  def on
    @port.write(@pin.to_i.chr)
  end

  def off
    @port.write((@pin.to_i+10).chr)
  end

end
