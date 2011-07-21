require 'rubygems'
require 'sinatra/base'
require './lib/sprinkler_system'
require './lib/sprinkler_system_builder'

class SprinklersApp < Sinatra::Base

  def initialize
    super

    builder = SprinklerSystemBuilder.new
    builder.add_station('1')
    builder.add_station('2')

    @sprinkler_system = builder.sprinkler_system()
  end

  set :static, true
  set :public, File.dirname(__FILE__) + '/static'

  get '/sprinkler/:sprinkler/on' do
    @sprinkler_system.disable_all
    @sprinkler_system.enable(params[:sprinkler])
    "done."
  end

  get '/sprinklers/off' do
    @sprinkler_system.disable_all
    "done."
  end


end

SprinklersApp.run!
