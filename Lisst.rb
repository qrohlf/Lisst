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
	@list = ListItem.all
	@modernizr = File.read("include/modernizr.js") #this is silly, need to fix
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
	ListItem.create(params)
	redirect("/edit")
end

put '/:item' do
	#update item in list
end

delete '/:item' do
    @list.delete(params[:item]);
	# delete item from the list
end

class List
	def initialize(path) 
		@file = File.new(path, "a+")
		@file.sync = true
	end

	def each(&block)
		Enumerator.new do |out|
			@file.each_with_index do |line, index|
				out.yield line.split(' : ').push(index + 1)
			end
		end.each(&block)
	end

	def reverse_each(&block)
		Enumerator.new do |out|
			lines = @file.readlines
			size = lines.count
			lines.reverse.each_with_index do |line, index|
				out.yield line.split(' : ').push(size - index)
			end
		end.each(&block)
	end

	def create(title, content)
		@file.puts title+" : "+content
	end

	def update(index, title, content)
		#update an item in the list
	end

	def delete(index)
		"deleting "+index
	end
	
end