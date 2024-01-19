require "r00lz/version"

module R00lz
  class App
    def call(env)
      [200,
       {'Content-Type' => 'text/html'},
       ['hello web from r00lz!']]
    end
  end
end
