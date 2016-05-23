require 'digest/md5'

module DynamicParser::RegexCache

  def self.match(regex, txt, &block)
    raise 'you must specify a block' unless block_given?
    retrieved_data = fetch("#{digest(regex.to_s)}/#{digest(txt)}") do
      matched = txt.match(regex)
      block.call(matched)
    end
  end

  protected
  def self.fetch(key, expiration=300, &block)
    raise 'you must specify a block' unless block_given?
    if defined?(Rails)
      Rails.cache.fetch(key, :expires_in => expiration) do
        block.call
      end
    else
      puts "[DynamicParser] No known driver available for caching! Using memory."
      @cache ||= block.call
    end
  end

  def self.digest(s)
    Digest::MD5.hexdigest(s)
  end
end
