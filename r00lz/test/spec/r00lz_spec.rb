require "test_helper"

class R00lzTest < Minitest::Test
  def test_app_returns_success
    env = { "PATH_INFO" => "/",
            "QUERY_STRING" => "" }
    assert_equal 200,
      ::R00lz::App.new.call(env)[0]
  end
end

describe R00lz do
  it "does something" do
    # ...
  end
end
