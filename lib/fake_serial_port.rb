class FakeSerialPort
  def write(s)
    puts "Writing: #{s}"
  end

  def close
    puts "Closing port..."
  end
end
