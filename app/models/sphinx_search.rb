class User < ActiveRecord::Base
  define_index do
    indexes :display_name, :login, :bio, :city, :country
  end
end

class Asset < ActiveRecord::Base
  define_index do
    indexes :title, :description, :filename, :lyrics
    has :album, :genre, :artist
  end
end