source 'https://rubygems.org'

gemspec

gem 'async-io', :git => 'https://github.com/eblocker/async-io.git', :branch => 'eblocker'
#gem 'async-io', :path => '../async-io'

group :development do
	gem "pry"
end

group :test do
	gem 'ruby-prof', platforms: [:mri]
	gem "benchmark-ips"
	
	gem 'simplecov'
	gem 'coveralls', require: false
	
	# For comparisons:
	gem "nokogiri"
end
