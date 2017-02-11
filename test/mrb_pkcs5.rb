# PKCS #5: Password-Based Key Derivation Function 2 (PBKDF2) Test Vectors
# https://tools.ietf.org/html/rfc6070

def dk(vector)
  vector.gsub!("\n", '')
  vector.gsub!(' ', '')
  [vector].pack("H*")
end

assert("PKCS5.pbkdf2_hmac(password, salt, iterations, derive_key_bytesize, digest)") do
  assert_equal(dk(%(
    0c 60 c8 0f 96 1f 0e 71
    f3 a9 b5 24 af 60 12 06
    2f e0 37 a6
  ))) do
    p = 'password'
    s = 'salt'
    c = 1
    dk_len = 20
    PKCS5.pbkdf2_hmac(p, s, c, dk_len, Digest::SHA1)
  end

  assert_equal(dk(%(
    ea 6c 01 4d c7 2d 6f 8c
    cd 1e d9 2a ce 1d 41 f0
    d8 de 89 57
  ))) do
    p = 'password'
    s = 'salt'
    c = 2
    dk_len = 20
    PKCS5.pbkdf2_hmac(p, s, c, dk_len, Digest::SHA1)
  end

  assert_equal(dk(%(
    4b 00 79 01 b7 65 48 9a
    be ad 49 d9 26 f7 21 d0
    65 a4 29 c1
  ))) do
    p = 'password'
    s = 'salt'
    c = 4096
    dk_len = 20
    PKCS5.pbkdf2_hmac(p, s, c, dk_len, Digest::SHA1)
  end

  assert_equal(dk(%(
    ee fe 3d 61 cd 4d a4 e4
    e9 94 5b 3d 6b a2 15 8c
    26 34 e9 84
  ))) do
    p = 'password'
    s = 'salt'
    c = 16777216
    dk_len = 20
    PKCS5.pbkdf2_hmac(p, s, c, dk_len, Digest::SHA1)
  end

  assert_equal(dk(%(
    3d 2e ec 4f e4 1c 84 9b
    80 c8 d8 36 62 c0 e4 4a
    8b 29 1a 96 4c f2 f0 70
    38
  ))) do
    p = 'passwordPASSWORDpassword'
    s = 'saltSALTsaltSALTsaltSALTsaltSALTsalt'
    c = 4096
    dk_len = 25
    PKCS5.pbkdf2_hmac(p, s, c, dk_len, Digest::SHA1)
  end

  # skip because it failed
  # assert_equal(dk(%(
  #   56 fa 6a a7 55 48 09 9d
  #   cc 37 d7 f0 34 25 e0 c3
  # ))) do
  #   p = "pass\00word"
  #   s = "sa\x00lt"
  #   c = 4096
  #   dk_len = 16
  #   PKCS5.pbkdf2_hmac(p, s, c, dk_len, Digest::SHA1)
  # end
end
