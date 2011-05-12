# config.ru
require "rubygems"
require 'rack/contrib'
require 'rack-rewrite'

use Rack::Rewrite do
  rewrite '/', '/index.html'
end

use Rack::Static, :urls => ["/"], :root => Dir.pwd + '/output'

# Empty app, should never be reached:
class Homepage
  def call(env)
    [200, {"Content-Type" => "text/html"}, ["There's a problem with my website/"] ]
  end
end
run Homepage.new