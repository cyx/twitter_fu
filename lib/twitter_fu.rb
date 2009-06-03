$LOAD_PATH.unshift(File.join(File.dirname(__FILE__)))

module TwitterFu
  autoload :Client,           'twitter_fu/client'
  autoload :ContentSanitizer, 'twitter_fu/content_sanitizer'
  
  def self.updates( username, *args )
    Client.new( username ).updates( *args )
  end
  
  def self.update( username, since = Time.now.utc )
    Client.new( username ).update( :since => since )
  end
end
