require 'sinatra'
require 'haml'
require 'Maruku'

get '/' do
  listfile = File.read("list.txt")
  @listItems = []
  File.foreach("list.txt") do |line|
  	item = line.split(' : ')
  	@listItems.push(item)
  end
  haml :index
post '/' do
		# add item to list
	end
delete '/:item' do
		# delete item from the list
	end
update '/:item' do
		# update item in the list
	end
end

class List
	def initialize(path) 
		@file = File.new(path, "r+")
end