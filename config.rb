require 'configatron'

configatron.configure_from_hash(
  {
    serial: {
      # file: "/dev/tty.usbserial-A7006RMY"
      file: "/dev/ttyUSB1"
    },
    stations: [
      {valve: 1, name: "Backyard/Playhouse"},
      {valve: 2, name: "Front Yard/Sidewalk"},
      {valve: 3, name: "Side of Basketball Court"},
      {valve: 4, name: "Backyard/North"},
      {valve: 5, name: "Front Yard/Shed"},
      {valve: 6, name: "Backyard/West"}
    ],
    schedules: [
      {start: "* * * * *", times: { } }
    ]
  }
)
