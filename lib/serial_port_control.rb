require 'serialport'

class SerialPortControl
  def initialize(args={})
    @serial_port = SerialPort.new(
      args.fetch(:file),
      args.fetch(:baud_rate, 9600),
      args.fetch(:data_bits, 8),
      args.fetch(:stop_bits, 1),
      args.fetch(:parity, 0)
      )
  end

  def write(s)
    puts "Writing: #{s.to_i}"
    @serial_port.write(s.chr)
  end

  def close
    @serial_port.close()
  end
end
