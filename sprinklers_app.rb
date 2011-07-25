require 'rubygems'
require 'sinatra/base'
require 'haml'
require './lib/sprinkler_system'
require './lib/sprinkler_system_builder'
require './lib/serial_port_control'

class SprinklersApp < Sinatra::Base

  def initialize
    super

    builder = SprinklerSystemBuilder.new
    8.times { |n| builder.add_station((n+1).to_s) }

    @sprinkler_system = builder.sprinkler_system()

    SerialPortControl.instance.connect()
  end

  set :static, true
  set :public, File.dirname(__FILE__) + '/static'

  get '/sprinkler/:sprinkler/on' do
    @sprinkler_system.disable_all
    @sprinkler_system.enable(params[:sprinkler])
    haml :summary
  end

  get '/sprinkler/:sprinkler/off' do
    @sprinkler_system.disable(params[:sprinkler])
    haml :summary
  end

  get '/sprinklers/off' do
    @sprinkler_system.disable_all
    haml :summary
  end


end

SprinklersApp.run!
