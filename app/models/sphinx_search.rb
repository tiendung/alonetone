##
# Sphinx Installation
##
# wget http://sphinxsearch.com/downloads/sphinx-0.9.8.1.tar.gz
# tar vxfz sphinx-0.9.8.1.tar.gz
# cd sphinx-0.9.8.1
# ./configure
# make
# sudo make install

##
# Remember to run following command to index data and start sphinx deamon
# rake ts:in
# rake ts:start

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
# Unify search interface if needed
class SphinxSearch
  def search(query)
    
  end
end