source 'https://rubygems.org'

gemspec

gem 'async-io', :git => 'ssh://git@bitbucket.hh.eblocker.com:7999/eb/async-dns.git', :branch => 'eblocker'
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
