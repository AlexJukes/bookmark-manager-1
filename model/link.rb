require 'data_mapper'
require 'dm-postgres-adapter'
require './model/setup.rb'
require 'dm-migrations'


class Link
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :url, String

end


  DataMapper::Logger.new($stdout, :debug)
  DataMapper.setup(:default, 'postgres://localhost/bookmark_manager_test')
  DataMapper.finalize
  DataMapper.auto_upgrade!
