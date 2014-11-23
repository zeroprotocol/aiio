require 'sinatra'
require './sinatra-ssl'

set :port, 443					 # HTTPS
set :ssl_certificate, "./certs/server.crt"       # change this if you want to use your certificates that are on your system
set :ssl_key, "./certs/server.key"               # change this also.
set :bind, '0.0.0.0'                             # change this to your desired ip bindings
set :template, "./webroot/"                      # change this to the template of your chosing

class AiIO
  def self.initialize
    InitializeXMLdb
    InitializeHooks
  end
# Initialize aiio XML database engine
  def InitializeXMLdb
  end

# Load plugins and determine which aiio functions need to be hooked based on hooks.xml in each plugin
# All hooks are chain linked and if configured to standard, work nicely with eachother
  def InitializeHooks
  end
end

aaio = AiIO.new

get "/" do
  "Test"
end
