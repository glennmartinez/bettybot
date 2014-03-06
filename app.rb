require 'rubygems'
require 'sinatra'
require 'json'
require 'mongoid'
# require 'rack-flash'
require 'sinatra/partial'
require 'logger'
require 'active_support/core_ext'
require 'action_view'
require "rest_client"
require 'rufus/scheduler'


# Dir[File.expand_path("lib/*.rb", File.dirname(__FILE__))].map {|f| require f}
Dir[File.expand_path("models/*.rb", File.dirname(__FILE__))].map {|f| require f}


configure do
  set :root, File.dirname(__FILE__)
  set :sessions, true
  set :bind, '0.0.0.0'

  set :views, "#{File.dirname(__FILE__)}/views"

  set :public_folder, 'public'
  set :erb, {:format => :html5} # default Haml format is :xhtml

  # Initialise Mongoid
  Mongoid.load!("config/mongoid.yml")
end

configure :development, :test do
  set :protection, :except => :frame_options  

  $logger = Logger.new(STDOUT)
  $logger.level = Logger::INFO
end

configure :production do
  # $logger = Logger.new('log/betty-log-production.log','weekly')
  # $logger.level = Logger::WARN
end


# helpers ActionView::Helpers::DateHelper
# helpers Helpers


get '/'	do

 "Testing Sinatra"
 @scores = Score.all 
 erb :index

end

get '/new' do

@score = Score.new
erb :new

end

post "/scores" do
  @score = Score.new(params[:score])
  if @score.save
    redirect "posts/#{@score.id}"
  else
    erb :"scores/new"
  end
end


get "/hipchat" do 

 @score = Score.all.to_json

 uri = "https://api.hipchat.com/v2/room/qa-bot/notification?auth_token=S8lyaBBoshJQupJUocIYOzK2LFeCRrj347cwXnfl"

 RestClient.post(uri,

  {
   "content-type": "application/json",
   "color":  "red",
   "message": "hello hello"

  }

  ) 


end 
