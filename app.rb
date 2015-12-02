require 'sinatra/base'
# require "sinatra/reloader" if development?
# require_relative 'helpers'
#
# Dir.glob("models/*.rb").each { |file| require_relative file }

class App < Sinatra::Base
  get '/' do
    erb :basic, :locals => {local_erb_var: "xyz"}
  end

  get '/upload' do
    haml :upload
  end

  post '/upload' do
    File.open('uploads/' + params['myfile'][:filename], "w") do |f|
      f.write(params['myfile'][:tempfile].read)
    end
    'The file was successfully uploaded!'
  end
end
