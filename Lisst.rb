require 'sinatra'
require "sinatra/config_file"
require 'haml'

config_file 'config.yml'

before :method => 'get' do
	@title = settings.title
	@list = List.new("list.txt")
	@modernizr = File.read("include/modernizr.js")
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
	# add item to list
end

put '/' do
	#update item in list
end

delete '/:item' do
	# delete item from the list
end

class List
	def initialize(path) 
		@file = File.new(path, "r+")
	end

	def each(&block)
		@file.each do |line|
			yield line.split(' : ')
		end
	end

	def create(index, title, content)
		#add an item to the list
	end

	def update(index, title, content)
		#update an item in the list
	end

	def delete(index)
		#delete an item from the list
	end
	
end