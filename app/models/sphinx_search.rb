##
# Indexing
class Asset < ActiveRecord::Base
  define_index do
    indexes :title, :description, :filename, :lyrics
    indexes [user.display_name, user.login], :as => :user
    has :created_at, :album, :genre, :artist
  end
end

class User < ActiveRecord::Base
  define_index do
    indexes :display_name, :login, :bio, :city, :country
    has :created_at
  end
end

class Post < ActiveRecord::Base
  define_index do
    indexes :body
    has :created_at
  end
end


##
# Searching
class SphinxSearch
  def search(query)
    
  end
end