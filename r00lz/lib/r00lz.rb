require "r00lz/version"
require "erb"

module R00lz
  class App
    def call(env)
      controller, action = controller_and_action(env)
      text = controller.new(env).send(action)
      [200,
       {'Content-Type' => 'text/html'},
       [text]]
    end

    private

    def controller_and_action(env)
      _, controller, action, after = env["PATH_INFO"].split('/')
      controller = controller.capitalize + 'Controller'
      [Object.const_get(controller), action]
    end
  end

  class Object
    def self.const_missing(c)
      require "controllers/#{R00lz.to_snakecase(c.to_s)}"
      Object.const_get(c)
    end
  end

  class Controller
    attr_reader :env
    def initialize(env)
      @env = env
    end

    def request
      @request ||= Rack::Request.new @env
    end

    def params
      request.params
    end

    def render(name, b = binding())
      template = "app/views/#{name}.html.erb"
      e = ERB.new(File.read template)
      e.result(b)
    end
  end

  def self.to_snakecase(s)
    s.gsub(/([A-Z+])([A-Z][a-z])/, '\1_\2').gsub(
      /([a-z\d])([A-Z])/, '\1_\2').downcase
  end
end
