#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require './config.rb'
require './lib/sprinklers'
require './lib/serial_port_control'
require './lib/fake_serial_port'

class SprinklersApp < Sinatra::Base

  def initialize
    super

    @serial = SerialPortControl.new(configatron.serial)
    # @serial = FakeSerialPort.new
    @stations = configatron.stations
  end

  Tilt.register Tilt::ERBTemplate, 'html.erb'

  set :static, true
  set :public_dir, File.dirname(__FILE__) + '/static'
  set :bind, '0.0.0.0'

  get '/' do
    erb :summary
  end

  get '/sprinkler/:sprinkler/on' do
    @stations = sprinklers_enable(@stations, params[:sprinkler])
    puts @stations
    sprinklers_update(@stations, @serial)
    erb :summary
  end

  get '/sprinkler/:sprinkler/off' do
    @stations = sprinklers_disable_all(@stations)
    sprinklers_update(@stations, @serial)
    erb :summary
  end

  get '/sprinklers/off' do
    @stations = sprinklers_disable_all(@stations)
    sprinklers_update(@stations, @serial)
    erb :summary
  end

end

SprinklersApp.run!
