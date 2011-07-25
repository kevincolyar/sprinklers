require 'singleton'
require 'serialport'

class SerialPortControl
  include Singleton

  def initialize
    @serial_port = SerialPort.new("/dev/tty.usbserial-A7006RMY", 9600, 8, 1, 0)
  end

  def connect
  end

  def write(s)
    @serial_port.write(s)
  end

  def close
    @serial_port.close()
  end

end
