require 'sinatra'
require "sinatra/config_file"
require 'haml'
require 'sinatra/activerecord'
require 'uri'
require './models/ListItem'
require 'omniauth'

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

before :method => 'get' do
	@title = settings.title
	@list = ListItem.all(order: 'id DESC')
end

get '/' do
  haml :index
end

get '/edit' do
	@editjs = File.read("include/edit.js")
    @jquery = true
	haml :edit
end

post '/' do
	redirect('/');
	ListItem.create(params)
	redirect("/edit")
end

put '/:item' do
	#update item in list
end

delete '/:item' do
	redirect('/');
    @list.delete(params[:item]);
	# delete item from the list
end