require 'opal'
require 'opal/jquery'
require 'models/foo'

Document.ready? do
  3.times do |i|
    Element['#foo'].append("<li>#{Foo.new.foo} #{i}</li>")
  end
end
