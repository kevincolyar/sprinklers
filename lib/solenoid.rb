require File.dirname(__FILE__) + '/serial_port_control'

class Solenoid

  def initialize(pin)
    @pin = pin
  end

  def on
    SerialPortControl.instance.write(@pin.to_i.chr)
  end

  def off
    SerialPortControl.instance.write((@pin.to_i+10).chr)
  end

end
