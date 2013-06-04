require 'sinatra'
require "sinatra/config_file"
require 'haml'

config_file 'config.yml'

before :method => 'get' do
	@title = settings.title
	@list = List.new("list.txt")
	@modernizr = File.read("include/modernizr.js")
	@order = settings.order
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
	@list.create(params[:title], params[:content])
	redirect('/edit')
end

put '/' do
	#update item in list
end

delete '/:item' do
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
		#delete an item from the list
	end
	
end