require "open-uri"
require "sinatra"
require "sinatra/respond_with"
require "sinatra/reloader"
require "sinatra/json"
require "uri"

uri_target = "https://www.googleapis.com/customsearch/v1"

configure do
	set :views, 'views'
end

get '/' do
	data_engine = JSON.parse(File.read("engine/engine_data.json"))

	if params[:search]
		query_string = {cx: data_engine["engine"]["cx"], q: params[:search], key: data_engine["engine"]["key"]}
		uri = URI.parse(uri_target)
		uri.query = URI.encode_www_form(query_string)
		@json =  JSON.parse(uri.open.read)
	end

	respond_to do |format|
		format.html { erb :search }
		format.json { json @json }
	end
end