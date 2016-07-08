require 'configatron'

configatron.configure_from_hash({
  serial: {
    file: "/dev/tty.usbserial-A7006RMY"
  }
})
