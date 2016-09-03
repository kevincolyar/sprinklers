def sprinklers_disable_all(stations)
  stations.map do |station|
    station.merge(on: false)
  end
end

def sprinklers_enable(stations, valve)
  stations.map do |station|
    station[:valve] == valve.to_i ? station.merge(on: true) : station
  end
end

def sprinklers_update(stations, serial)
  stations.each do |station|
    puts station[:valve].to_i
    val = station[:valve].to_i + (station[:on] ? 0 : 10)
    puts val
    serial.write(val)
  end
end
