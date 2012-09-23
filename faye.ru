# -*- encoding : utf-8 -*-
require "faye"
require 'hashie'
load 'faye/client_event.rb'

# Faye::WebSocket.load_adapter('thin')

# PrivatePub.load_config(File.expand_path("../config/private_pub.yml", __FILE__), ENV["RAILS_ENV"] || "development")
# run PrivatePub.faye_app


# PrivatePub.load_config(File.expand_path("../config/private_pub.yml", __FILE__), ENV["RAILS_ENV"] || "development")
# faye_server = PrivatePub.faye_app
# faye_server.add_extension(ClientEvent.new)
# run faye_server


faye_server = Faye::RackAdapter.new(:mount => '/faye', :timeout => 25)
# faye_server.listen(9292)
Faye::WebSocket.load_adapter 'thin'
faye_server.add_extension(ClientEvent.new)
run faye_server
