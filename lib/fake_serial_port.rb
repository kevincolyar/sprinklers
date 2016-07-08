class FakeSerialPort
  def initialize(args={})
  end

  def write(s)
    puts "Writing: #{s}"
  end

  def close
    puts "Closing port..."
  end
end
