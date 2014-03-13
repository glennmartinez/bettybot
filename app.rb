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


  set :public_folder, 'public'
  set :erb, {:format => :html5} # default Haml format is :xhtml

  # Initialise Mongoid
  Mongoid.load!("config/mongoid.yml")
end

configure :development, :test do
  set :protection, :except => :frame_options  
  set :port, 9494

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


post "/hipchat" do 

 @score = Score.all.to_json

   params = JSON.parse(request.env["rack.input"].read)


 uri = "https://api.hipchat.com/v2/room/qa-bot/notification?auth_token=S8lyaBBoshJQupJUocIYOzK2LFeCRrj347cwXnfl"

 RestClient.post(uri,

  {
   "content-type" => "application/json",
   "color" => "red",
   "message" => "#{params}"

  }.to_json,
  :content_type => :json, :accept => :json


  ) 


end 



post "/savescores" do

 # puts requestBody = request.body.to_json
 # puts requestBody["teamname"]

  puts params = JSON.parse(request.env["rack.input"].read)
  puts params["teamname"]
  puts params["bugscore"]

  score = 
    {
    teamname: params["teamname"],
    bugscore: params["bugscore"],
    date: Date.parse(params["date"].to_s)
    }

  Score.create score 



end 

