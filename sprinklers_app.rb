#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require './config.rb'
require './lib/sprinkler_system'
require './lib/sprinkler_system_builder'
require './lib/serial_port_control'
require './lib/fake_serial_port'

class SprinklersApp < Sinatra::Base

  def initialize
    super

    builder = SprinklerSystemBuilder.new
    builder.add_serial_port(
      FakeSerialPort.new(configatron.serial)
    )

    8.times { |n| builder.add_station((n+1).to_s) }

    @sprinkler_system = builder.sprinkler_system()
  end

  Tilt.register Tilt::ERBTemplate, 'html.erb'

  set :static, true
  set :public_dir, File.dirname(__FILE__) + '/static'

  get '/' do
    erb :summary
  end

  get '/sprinkler/:sprinkler/on' do
    @sprinkler_system.disable_all
    @sprinkler_system.enable(params[:sprinkler])
    erb :summary
  end

  get '/sprinkler/:sprinkler/off' do
    @sprinkler_system.disable(params[:sprinkler])
    erb :summary
  end

  get '/sprinklers/off' do
    @sprinkler_system.disable_all
    erb :summary
  end

end

SprinklersApp.run!
