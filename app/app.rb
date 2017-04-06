require 'pry'
ENV['RACK_ENV']||= 'development'
require 'sinatra/base'
require './app/models/link.rb'
require './app/data_mapper_setup.rb'

class BookmarkManager < Sinatra::Base
  set :sessions, true

  get '/' do
    'Hello World!'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    params[:tags].split.each do |name| 
      link.tags << Tag.first_or_create(name: name)
    end
    link.save
    redirect '/links'
  end

  post '/users' do

    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get '/users/new' do
    erb :'users/new'

  end
end
