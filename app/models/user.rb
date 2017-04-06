require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'
require 'bcrypt'

class User

  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :email, String
  property :password, String

  #def password
    #@password ||= Password.new(password_hash)
  #end
end
