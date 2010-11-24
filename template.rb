run "rm -Rf .gitignore README public/index.html"

gem 'will_paginate', '>=3.0.pre2'
gem 'devise', '>=1.1.2'
gem 'friendly_id', '~>3.0'



gem 'rspec', '>=2.0.1', :group => [:development, :rspec]
gem 'rspec-rails', '>=2.0.1', :group => [:development, :rspec]
gem "factory_girl_rails", :group => [:development, :rspec]

gem 'cucumber', ">=0.9.4", :group => [:development, :cucumber]
gem 'cucumber-rails', ">=0.3.2", :group => [:development, :cucumber]
gem 'capybara', ">=0.3.9", :group => [:development, :cucumber]
gem 'database_cleaner', ">=0.5.0", :group => [:development, :cucumber]
gem 'spork', ">=0.8.4", :group => [:development, :cucumber]
gem "pickle", ">=0.4.2", :group => [:development, :cucumber]


run "bundle install"

generate "rspec:install"
generate "cucumber:install --capybara --rspec --spork"
generate "pickle --path --email"
generate "friendly_id"
generate "devise:install"
generate "devise User"
generate "devise Admin"
generate "devise:views"


get "http://github.com/rails/jquery-ujs/raw/master/src/rails.js", "public/javascripts/rails.js"
get "http://github.com/rinaldifonseca/Rails-3-Template/raw/master/.gitignore" ,".gitignore" 
get "http://github.com/rinaldifonseca/Rails-3-Template/raw/master/app/controllers/home_controller.rb", "app/controllers/home_controller.rb"
get "http://github.com/rinaldifonseca/Rails-3-Template/raw/master/config/locales/devise.pt-BR.yml", "config/locales/devise.pt-BR.yml"
get "http://github.com/rinaldifonseca/Rails-3-Template/raw/master/config/locales/pt-BR.yml", "config/locales/pt-BR.yml"
get "http://github.com/rinaldifonseca/Rails-3-Template/raw/master/features/authentication.feature", "features/authentication.feature"
get "http://github.com/rinaldifonseca/Rails-3-Template/raw/master/features/support/factory_girl.rb", "features/support/factory_girl.rb"
get "http://github.com/rinaldifonseca/Rails-3-Template/raw/master/spec/support/factories/users.rb", "spec/support/factories/users.rb"


append_file 'Rakefile', <<-METRIC_FU

MetricFu::Configuration.run do |config|  
  config.rcov[:rcov_opts] << "-Ispec"  
end rescue nil
METRIC_FU


git :init
git :add => '.'
git :commit => '-am "Initial commit"'
 
puts "SUCCESS!"

