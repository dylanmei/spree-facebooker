Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_facebooker'
  s.version     = '0.1.0'
  s.summary     = 'Facebook API integration for Spree'
  s.description = 'Facebook API integration for your Spree store, using the facebooker2 gem.'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Dylan Meissner'
  # s.email             = ''
  # s.homepage          = ''
  # s.rubyforge_project = ''

  s.files        = Dir['README.textile', 'LICENSE', 'lib/**/*', 'app/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.has_rdoc = true

  s.add_dependency('spree_core', '>= 0.30.1')
  s.add_dependency('facebooker2', '>=0.0.5')
end
