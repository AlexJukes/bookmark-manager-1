require 'pry'
ENV['RACK_ENV']||= 'development'
require 'sinatra/base'
require './app/data_mapper_setup.rb'

class BookmarkManager < Sinatra::Base
  set :sessions, true

  get '/' do
    'Hello World!'
  end

  get '/links' do
    @links = Link.all
    @user_email = User.first.email
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

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    User.create(email: params[:email], password: params[:password])
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

end
