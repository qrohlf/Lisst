require 'sinatra'
require "sinatra/config_file"
require 'haml'
require 'sinatra/activerecord'
require 'uri'
require './models/ListItem'
require 'omniauth'
require 'omniauth-google-oauth2'

config_file 'config.yml'

db = URI.parse(ENV['DATABASE_URL'])

ActiveRecord::Base.establish_connection(
  :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
  :host     => db.host,
  :port     => db.port,
  :username => db.user,
  :password => db.password,
  :database => db.path[1..-1],
  :encoding => 'utf8'
)

# Session:Cookie needed by OmniAuth
use Rack::Session::Cookie
# MethodOverride for RESTful interface
use Rack::MethodOverride
# Use OmniAuth Google Strategy
use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_KEY"], ENV["GOOGLE_SECRET"],
    {
      :scope => "userinfo.email",
      #:prompt => "select_account",
      :image_aspect_ratio => "square",
      :image_size => 50
    }
end

# load title and data before methods that need it
before :method => 'get' do
	@title = settings.title
	@list = ListItem.all(order: 'id DESC')
end

# the homepage
get '/' do
  haml :index
end

# the editing page. 
get '/edit' do
    redirect("/unauthorized") unless can_edit
    @auth = session[:auth]
	haml :edit
end

post '/' do
  redirect("/unauthorized") unless can_edit
	ListItem.create(params)
	redirect("/edit")
end

delete '/:item' do
  redirect("/unauthorized") unless can_edit
  ListItem.find(params[:item]).destroy
  redirect("/edit", 303)
end

put '/:id' do |id|
  ListItem.update(id, {title: params[:title], content: params[:content]})
  "success"
end

get '/auth/google_oauth2/callback' do
    session[:auth] = request.env['omniauth.auth']
    redirect(request.env['omniauth.origin'], 303)
end

get '/logout' do 
    session.clear
    redirect('/')
end

get '/unauthorized' do 
    haml :unauthorized
end

def can_edit
    auth = session[:auth]
    redirect("/auth/google_oauth2?origin=#{URI.escape request.fullpath}") if auth.nil?
    settings.can_edit.include? auth[:info][:email]
end
