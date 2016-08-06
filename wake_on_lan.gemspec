# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wake_on_lan/version'

Gem::Specification.new do |spec|
  spec.name          = "wake_on_lan"
  spec.version       = WakeOnLan::VERSION
  spec.authors       = ["Balazs Szerencsi"]
  spec.email         = ["balazs.szerencsi@icloud.com"]

  spec.summary       = 'Wake on LAN'
  spec.description   = <<-DESCRIPTION
  WOL implementation in Ruby, for more info on Wake on LAN please see:
  https://en.wikipedia.org/wiki/Wake-on-LAN
  DESCRIPTION
  spec.homepage      = 'https://github.com/BlasiusVonSzerencsi/wake-on-lan-ruby'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
