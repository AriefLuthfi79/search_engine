require "open-uri"
require "sinatra"
require "uri"

uri_target = "https://www.googleapis.com/customsearch/v1"

configure do
	set :views, 'views'
end

get '/' do
	data_engine = JSON.parse(File.read("engine/engine_data.json"))

	# if params[:search]
		query_string = {cx: data_engine["engine"]["cx"], q: "botak", key: data_engine["engine"]["key"]}
		uri = URI.parse(uri_target)
		uri.query = URI.encode_www_form(query_string)
		uri.open.read
	# end
end