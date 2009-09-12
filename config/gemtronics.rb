group(:default) do |g|
  g.add('rails', :load => false, :version => '2.3.4')
  g.add('markbates-gemtronics', :load => false, :version => '>=0.5.1', :source => 'http://gems.github.com')
  g.add('configatron', :version => '>=2.5.1')
  g.add('markbates-delayed_job_extras', :require => 'delayed_job_extras', :load => false, :version => '>=0.1.6', :source => 'http://gems.github.com')
  g.add('javan-whenever', :load => false, :version => '>=0.3.7')
  g.add('cachetastic', :version => '>=3.0.4')
  g.add('mbleigh-acts-as-taggable-on', :version => ">=1.0.5", :require => "acts-as-taggable-on", :source => 'http://gems.github.com')
  g.add('mislav-will_paginate', :version => ">=2.3.11", :require => "will_paginate", :source => 'http://gems.github.com')
  g.add('semanticart-is_paranoid', :version => ">=0.9.0", :require => "is_paranoid", :source => 'http://gems.github.com')
  g.add('authlogic', :version => ">=2.1.2", :require => "authlogic")
  g.add('paperclip', :version => ">=2.1.2", :require => "paperclip")
end

group(:production, :dependencies => :default) do |g|
  
end

group(:development, :dependencies => :default) do |g|
  
end

group(:test, :dependencies => :development, :load => false) do |g|
  g.add('rspec', :require => 'spec', :version => '1.2.8')
  g.add('rspec-rails', :version => '1.2.7.1')
  g.add('remarkable_rails', :version => '3.1.10')
  g.add('fakeweb', :version => '1.2.6')
  g.add('thoughtbot-factory_girl', :version => '1.2.2', :require => 'factory_girl', :source => 'http://gems.github.com')
end

group(:cucumber, :dependencies => :test) do |g|
  g.add('cucumber', :version => '0.3.100')
  g.add('webrat', :version => '>=0.5.3')
end
