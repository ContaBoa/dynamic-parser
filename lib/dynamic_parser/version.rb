# Keeps the versioning clean and simple.
module DynamicParser
  module Version
    MAJOR = 0
    MINOR = 0
    PATCH = 2
    ALPHA = nil # ex: '.pre.1'
    STRING = "#{MAJOR}.#{MINOR}.#{PATCH}#{ALPHA}"
  end
end
