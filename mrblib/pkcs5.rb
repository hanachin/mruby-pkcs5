module PKCS5
  def self.pbkdf2_hmac(password, salt, iterations, derive_key_bytesize, digest)
    hash_key_bytesize = digest.new.digest_length
    derived_key = ""
    n = (derive_key_bytesize / hash_key_bytesize.to_f).ceil
    (1..n).each do |i|
	    t = u = Digest::HMAC.digest(salt + [i].pack("N"), password, digest)
      (1...iterations).each do
        u = Digest::HMAC.digest(u, password, digest)
        t ^= u
      end
      derived_key += t
    end
    derived_key[0, derive_key_bytesize]
  end
end
