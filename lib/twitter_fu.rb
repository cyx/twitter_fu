$LOAD_PATH.unshift(File.join(File.dirname(__FILE__)))

module TwitterFu
  autoload :Client, 'twitter_fu/client'
  
  def self.updates( username )
    Client.new( username ).updates
  end
  
  def self.update( username, since = Time.now.utc )
    Client.new( username ).update( :since => since )
  end
end