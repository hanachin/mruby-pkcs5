MRuby::Gem::Specification.new('mruby-pkcs5') do |spec|
  spec.license = 'MIT'
  spec.author  = 'Seiei Miyagi'
  spec.summary = 'Provide PKCS5 functionality with mruby-digest'
  spec.add_dependency 'mruby-digest'
  spec.add_dependency 'mruby-pack'
  spec.add_dependency 'mruby-string-xor'
end
