require 'roda'
require 'tilt/opal'

builder = Opal::Builder.new(:stubs=>['opal'])
builder.append_paths('assets/js')
builder.use_gem('opal-jquery')
Roda.plugin :assets, :js=>%w'test.rb', :js_opts=>{:builder=>builder}

Roda.route do |r|
  r.assets

  r.root do
    <<END
<!DOCTYPE html>
<html>
<head>
<title>Roda/Opal Integration Test</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://cdn.opalrb.org/opal/0.7.1/opal.min.js"></script>
#{assets(:js)}
</head>
<body>
 <h1>Roda/Opal Integration Test</h1>
 <ul id="foo">
 </ul>
</body>
</html>
END
  end
end

run Roda.app
