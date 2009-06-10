require 'test_helper'

class ClientTest < Test::Unit::TestCase
  context "a Client with a username of cyx" do
    setup do
      @client = TwitterFu::Client.new( 'cyx' )
    end

    should "respond to updates" do
      assert @client.respond_to?(:updates)
    end
    
    context "given the feed is from the fixture feed" do
      setup do
        @feed = File.open( File.dirname(__FILE__) + '/fixtures/cyx.rss', 'r' )
        @client.stubs(:open).returns(@feed)
      end
      
      context "updates" do
        should "open http://twitter.com/statuses/user_timeline/cyx.rss" do
          @client.expects(:open).
            with('http://twitter.com/statuses/user_timeline/cyx.rss').
            returns(@feed)
          
          @client.updates
        end
      
        should "return an array" do
          assert @client.updates.instance_of?( Array )
        end
      
        should "contain 20 items" do
          assert_equal 20, @client.updates.size
        end
      
        should "return cyx: nice laker win as the first entry" do
          assert_equal "cyx: nice laker win", @client.updates.first.title
        end
        
        should "return nice laker win as the first entry's content" do
          assert_equal "nice laker win", @client.updates.first.content
        end
      
        should "return cyx: i think DHH got pissed... as the last entry" do
          assert_equal "cyx: i think DHH got pissed by ignorant bigots?", 
            @client.updates.last.title
        end
      end
    
      context "updates :since => May 11" do
        setup do
          @time = Time.parse( 'May 11, 2009' )
          @updates = @client.updates(:since => @time)
        end

        should "return 5 entries" do
          assert_equal 5, @updates.size
        end
      end
    
      context "update :since => Date in the future" do
        should "return an empty array" do
          assert_equal [], @client.updates(:since => Time.now.utc)
        end
      end
    end
  end
  
  
  context "a Client given an invalid username" do
    setup do
      @client = TwitterFu::Client.new('aoeuthaoseuth')
    end

    should "not be valid" do
      @client.expects(:open).raises(
        OpenURI::HTTPError.new("msg", StringIO.new)
      )
      
      assert_equal false, @client.valid?
    end
  end
  
end