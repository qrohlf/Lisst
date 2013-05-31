require 'sinatra'
require 'haml'

get '/' do
  @list = List.new("list.txt");
  haml :index
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
	extend Forwardable
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