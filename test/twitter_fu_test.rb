require 'test_helper'

class TwitterFuTest < Test::Unit::TestCase
  context "updates( cyx )" do
    setup do
      @client = stub("Client", :updates => :updates)
      TwitterFu::Client.expects(:new).with('cyx').returns(@client)
    end
    
    should "instantiate a Client with cyx as username" do
      TwitterFu.updates('cyx')
    end
    
    should "return the client's updates" do
      assert_equal :updates, TwitterFu.updates('cyx')
    end
  end
  
end
