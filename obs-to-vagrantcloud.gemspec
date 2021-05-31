# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'obs-to-vagrantcloud'
  s.version     = '0.0.1'
  s.summary     = 'Upload or link Vagrant boxes from the Open Build Service to Vagrant Cloud'
  s.description = 'Upload or link Vagrant boxes from the Open Build Service to Vagrant Cloud'
  s.authors     = ['Dan Čermák']
  s.email       = 'dcermak@suse.com'
  s.files       = Dir['LICENSE', 'README', 'obs-to-vagrantcloud.rb']
  s.homepage    = 'https://github.com/dcermak/obs-to-vagrantcloud'
  s.license     = 'MIT'

  s.add_runtime_dependency 'down', '>= 4.4', '< 6.0'
  s.add_runtime_dependency 'http', '>= 4', '< 6'
  s.add_runtime_dependency 'vagrant_cloud', '~> 3.0'
end
