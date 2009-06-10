require 'open-uri'
require 'rss/1.0'
require 'rss/2.0'

module TwitterFu
  class Client
    URI = "http://twitter.com/statuses/user_timeline/%s.rss"
    
    def initialize( username )
      @username = username
    end
    
    def valid?
      begin
        resource.head
      rescue OpenURI::HTTPError
        return false
      else
        return true
      end
    end
    
    def updates( options = {} )
      content = resource.read
      
      rss = RSS::Parser.parse( content, false )
      with_content(since( rss.items, options[:since] ))
    end
    
    protected
      def resource
        open( sprintf(URI, @username) )
      end
      
      def open(*args)
        Kernel.open(*args)
      end
      
      def since( items, time )
        if time
          items.select { |item| item.pubDate > time }
        else
          items
        end
      end
      
      def with_content( collection )
        collection.map { |elem| 
          elem.instance_variable_set(:@__username, @username)
          elem.extend ContentSanitizer 
        }
      end
  end
end