mruby-pkcs5   [![Build Status](https://travis-ci.org/hanachin/mruby-pkcs5.svg?branch=master)](https://travis-ci.org/hanachin/mruby-pkcs5)
====

Provide PKCS5 functionality with mruby-digest

Installation
----

Add this line to build_config.rb

```ruby
MRuby::Build.new do |conf|
  conf.gem github: 'hanachin/mruby-pkcs5'
end
```

or add this line to your aplication's mrbgem.rake

```ruby
MRuby::Gem::Specification.new('your-mrbgem') do |spec|
  spec.add_dependency 'mruby-pkcs5', github: 'hanachin/mruby-pkcs5'
end
```


Usage
----

```ruby
p = 'password'
s = 'salt'
c = 1
dk_len = 20
digest = Digest::SHA1
PKCS5.pbkdf2_hmac(p, s, c, dk_len, digest)
```

How to run test
----

    $ git clone https://github.com/hanachin/mruby-pkcs5.git
    $ cd mruby-pkcs5
    $ ./test.sh

License
----

MIT
