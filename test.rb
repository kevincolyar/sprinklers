#!/usr/bin/env ruby
#
require 'rubygems'
require 'serialport'

serial_port = SerialPort.new("/dev/tty.usbserial-A7006RMY", 9600, 8, 1, 0)

# while true
#   # printf("Got: %c", serial_port.getc)
#   c = serial_port.getc
#   puts "Got: #{c}"
# 
getc
  serial_port.putc("A")
# end

serial_port.close()
