require "test_helper"
require 'pry'

class TedController < R00lz::Controller
  def think; "american talk"; end

  def think_again; params['idea'] || 'blank'; end
end

class R00lzTest < Minitest::Test
  def test_new_controller_action
    e = { "PATH_INFO" => "/ted/think", 
          "QUERY_STRING" => "" }
    assert_equal 200, ::R00lz::App.new.call(e)[0]
  end

end

describe R00lz do
  it "does something" do
    # ...
  end
end
